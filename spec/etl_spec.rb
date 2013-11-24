require 'mysql2'
require 'etl'

describe ETL do
  before(:each) do
    # @src = Mysql2::Client.new(username: 'root', database: 'db1')
    # @dest = Mysql2::Client.new(username: 'root', database: 'db2')
    @src = double('Mysql2::Client')
    @dest = double('Mysql2::Client')
  end

  it 'should run' do
    etl = ETL.new(@src, @dest)
    etl.should receive(:extract)
    etl.should receive(:transform)
    etl.should receive(:load)
    etl.run
  end

  it 'should extract the data from src' do
    @src.should receive(:query)
    ETL.new(@src, @dest).extract
  end

  it 'should transform the result adding the field country' do
    data = ETL.new(@src, @dest).transform([{ id: 1 }])
    data[0].should have_key('country')
  end

  it 'should load the data to dest' do
    @dest.should receive(:query)
    ETL.new(@src, @dest).load([{ id: 1 }])
  end
end
