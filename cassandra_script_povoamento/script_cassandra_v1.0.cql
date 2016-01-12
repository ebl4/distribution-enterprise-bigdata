DROP TABLE Vendedor;
DROP TABLE DimGeography;
DROP TABLE DimGeography;
DROP TABLE DimSalesTerritory;

CREATE TABLE Comprador(
	CPF varchar PRIMARY KEY,
	Nome varchar ,
	Data_Nascimento varchar ,
	Telefone varchar ,
	Email varchar ,
	GeographyKey int
);

CREATE INDEX Comprador_nome ON Comprador( Nome );

CREATE TABLE DimDate(
	DateKey int  PRIMARY KEY,
	FullDateAlternateKey date  ,
	DayNumberOfWeek tinyint  ,
	EnglishDayNameOfWeek varchar  ,
	SpanishDayNameOfWeek varchar  ,
	FrenchDayNameOfWeek varchar  ,
	DayNumberOfMonth tinyint  ,
	DayNumberOfYear smallint  ,
	WeekNumberOfYear tinyint  ,
	EnglishMonthName varchar  ,
	SpanishMonthName varchar  ,
	FrenchMonthName varchar  ,
	MonthNumberOfYear tinyint  ,
	CalendarQuarter tinyint  ,
	CalendarYear smallint  ,
	CalendarSemester tinyint  ,
	FiscalQuarter tinyint  ,
	FiscalYear smallint  ,
	FiscalSemester tinyint  
);

CREATE TABLE Fornecedor(
	CNPJ varchar  PRIMARY KEY,
	Nome varchar ,
	Telefone varchar ,
	Email varchar ,
	Reputacao varchar  ,
	GeographyKey int 
) ;

CREATE INDEX Fornecedor_nome ON Fornecedor( Nome );

CREATE TABLE Garantia(
	Cod_Garantia varchar  PRIMARY KEY,
	Valor double ,
	Periodo_extensao float  
) ;

CREATE INDEX Garantia_extensao ON Garantia( Periodo_extensao );

CREATE TABLE Gerente(
	CPF varchar   PRIMARY KEY,
	Nome varchar ,
	Email varchar ,
	Salario float ,
	Setor varchar ,
	Qualificacao varchar ,
	GeographyKey int 
) ;

CREATE INDEX Gerente_nome ON Produto( Nome );

CREATE TABLE Produto(
	Cod_produto varchar   PRIMARY KEY,
	Cod_garantia varchar  ,
	Preco double ,
	Descricao varchar ,
	Nome varchar 
) ;

CREATE INDEX Produto_nome ON Produto( Nome );

CREATE TABLE Vendedor(
	Cod_vendedor varchar   PRIMARY KEY,
	Nome varchar ,
	Email varchar ,
	Salario double ,
	CPF varchar ,
	Produtividade varchar ,
	Endereco varchar 
) ;

CREATE INDEX Vendedor_nome ON Vendedor( Nome );

CREATE TABLE Venda(
	Cod_venda varchar PRIMARY KEY,
	Cod_gerente varchar,
	Cod_produto varchar,
	Cod_fornecedor varchar,
	DateKey int,
	Valor_venda float
) ;

CREATE INDEX Venda_produto ON Venda( Cod_produto );
CREATE INDEX Venda_gerente ON Venda( Cod_gerente );
CREATE INDEX Venda_fornecedor ON Venda( Cod_fornecedor );
