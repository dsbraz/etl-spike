require 'pry'

class ETL
  def initialize(src, dest)
    @src = src
    @dest = dest
  end

  def run
    load(transform(extract))
  end

  def extract
    @src.query("select id, name, address, city from customer")
  end

  def transform(data)
    data.each { |d| d['country'] = 'br' }
  end

  def load(data)
    data.each do |d|
      stmt = <<-SQL
        insert into customer values (
          #{d['id']}, "#{d['name']}", "#{d['address']}",
          "#{d['city']}", "#{d['country']}"
        );
      SQL
      @dest.query(stmt)
    end
  end

end
