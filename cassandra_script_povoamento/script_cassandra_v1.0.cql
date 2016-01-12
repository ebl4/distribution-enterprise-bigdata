DROP TABLE Vendedor;
DROP TABLE DimGeography;
DROP TABLE DimGeography;
DROP TABLE DimSalesTerritory;

CREATE TABLE Comprador(
	CPF varchar PRIMARY KEY,
	Nome varchar,
	Data_Nascimento varchar,
	Telefone varchar,
	Email varchar,
	GeographyKey int
);

CREATE INDEX Comprador_nome ON Comprador( Nome );

CREATE TABLE Fornecedor(
	CNPJ varchar PRIMARY KEY,
	Nome varchar,
	Telefone varchar,
	Email varchar,
	Reputacao varchar,
	GeographyKey int 
);

CREATE INDEX Fornecedor_nome ON Fornecedor( Nome );

CREATE TABLE Garantia(
	Cod_Garantia varchar PRIMARY KEY,
	Valor double,
	Periodo_extensao float  
);

CREATE INDEX Garantia_extensao ON Garantia( Periodo_extensao );

CREATE TABLE Gerente(
	CPF varchar PRIMARY KEY,
	Nome varchar,
	Email varchar,
	Salario float,
	Setor varchar,
	Qualificacao varchar,
	GeographyKey int 
);

CREATE INDEX Gerente_nome ON Produto( Nome );

CREATE TABLE Produto(
	Cod_produto varchar PRIMARY KEY,
	Cod_garantia varchar,
	Preco double,
	Descricao varchar,
	Nome varchar 
);

CREATE INDEX Produto_nome ON Produto( Nome );

CREATE TABLE Vendedor(
	Cod_vendedor varchar PRIMARY KEY,
	Nome varchar,
	Email varchar,
	Salario double,
	CPF varchar,
	Produtividade varchar,
	Endereco varchar 
);

CREATE INDEX Vendedor_nome ON Vendedor( Nome );
CREATE INDEX Vendedor_produtividade ON Vendedor( Produtividade );

CREATE TABLE Venda(
	Cod_venda varchar PRIMARY KEY,
	Cod_gerente varchar,
	Cod_produto varchar,
	Cod_fornecedor varchar,
	DateKey int,
	Valor_venda float
);

CREATE INDEX Venda_produto ON Venda( Cod_produto );
CREATE INDEX Venda_gerente ON Venda( Cod_gerente );
CREATE INDEX Venda_fornecedor ON Venda( Cod_fornecedor );

CREATE OR REPLACE FUNCTION averageState ( state tuple<int,bigint>, val int )
  CALLED ON NULL INPUT
  RETURNS tuple<int,bigint>
  LANGUAGE java
  AS '
    if (val != null) {
      state.setInt(0, state.getInt(0)+1);
      state.setLong(1, state.getLong(1)+val.intValue());
    }
    return state;
  ';

CREATE OR REPLACE FUNCTION averageFinal ( state tuple<int,bigint> )
  CALLED ON NULL INPUT
  RETURNS double
  LANGUAGE java
  AS '
    double r = 0;
    if (state.getInt(0) == 0) return null;
    r = state.getLong(1);
    r /= state.getInt(0);
    return Double.valueOf(r);
  ';

CREATE OR REPLACE AGGREGATE average ( int )
  SFUNC averageState
  STYPE tuple<int,bigint>
  FINALFUNC averageFinal
  INITCOND (0, 0);
  
CREATE FUNCTION count_state ( state bigint, val counter )
  CALLED ON NULL INPUT
  RETURNS bigint
  LANGUAGE java
  AS '
      if (val != null)
          state = state + 1;
      return state;
  ';

CREATE AGGREGATE count ( counter )
  SFUNC count_state
  STYPE bigint
  INITCOND 0;

CREATE OR REPLACE FUNCTION group_and_count_state( state map<varchar, int>, type varchar )
CALLED ON NULL INPUT
RETURNS map<varchar, int>
LANGUAGE java AS '
Integer count = (Integer) state.get(type);  if (count == null) count = 1; else count++; state.put(type, count); return state; ' ;

CREATE OR REPLACE AGGREGATE group_and_count(varchar) 
SFUNC group_and_count_state 
STYPE map<varchar, int> 
INITCOND {};

CREATE OR REPLACE FUNCTION group_and_sum_state( state map<varchar, float>, type varchar, candidate float)
CALLED ON NULL INPUT
RETURNS map<varchar, float>
LANGUAGE java AS '
Double sum = (Double) state.get(type);  if (sum == null) sum = candidate; else sum = sum + candidate; state.put(type, sum); return state; ' ;

CREATE OR REPLACE AGGREGATE group_and_sum(varchar, float) 
SFUNC group_and_sum_state 
STYPE map<varchar, float> 
INITCOND {};

