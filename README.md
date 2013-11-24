# Extract, Transform and Load

*Não use em produção*

Teste de conceito da implementação de um ETL simples em Ruby.

Lê os dados da tabela customer no banco 'db1'; adiciona o campo country as linhas do retornadas; carrega a tabela customer no banco 'db2'

## Possíveis melhorias:
- Extrair o conteúdo dos métodos extract, transform e load para classes separadas;
- Para grandes volumes de dados, utilizar a opção "stream" do Mysql2 e executar o transform e o load "online", ou;
- Se o server tiver memória suficiente, paralelizar os inserts no load

