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
	GeographyKey int ,


) ;


CREATE TABLE Garantia(
	Cod_Garantia varchar  PRIMARY KEY,
	Valor double ,
	Periodo_extensao float  	


) ;

CREATE TABLE Gerente(
	CPF varchar   PRIMARY KEY,
	Nome varchar ,
	Email varchar ,
	Salario float ,
	Setor varchar ,
	Qualificacao varchar ,
	GeographyKey int 
 
) ;

CREATE TABLE Produto(
	Cod_produto varchar   PRIMARY KEY,
	Cod_garantia varchar  ,
	Preco double ,
	Descricao varchar ,
	Nome varchar 

) ;

CREATE TABLE Vendedor(
	Cod_vendedor varchar   PRIMARY KEY,
	Nome varchar ,
	Email varchar ,
	Salario double ,
	CPF varchar ,
	Produtividade varchar ,
	Endereco varchar  
 
) ;


CREATE TABLE DimGeography(
	GeographyKey int  PRIMARY KEY  ,
	City varchar ,
	StateProvinceCode varchar ,
	StateProvinceName varchar ,
	CountryRegionCode varchar ,
	EnglishCountryRegionName varchar ,
	SpanishCountryRegionName varchar ,
	FrenchCountryRegionName varchar ,
	PostalCode varchar ,
	SalesTerritoryKey int ,
	IpAddressLocator varchar 

);


CREATE TABLE DimSalesTerritory(
	SalesTerritoryKey int   PRIMARY KEY ,
	SalesTerritoryAlternateKey int ,
	SalesTerritoryRegion varchar  ,
	SalesTerritoryCountry varchar  ,
	SalesTerritoryGroup varchar ,
	SalesTerritoryImage blob
 
) ;

