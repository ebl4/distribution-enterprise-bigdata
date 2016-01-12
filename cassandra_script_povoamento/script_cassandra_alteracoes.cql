DROP TABLE DimDate;

CREATE INDEX Comprador_nome ON Comprador( Nome );

CREATE INDEX Fornecedor_nome ON Fornecedor( Nome );

CREATE INDEX Garantia_extensao ON Garantia( Periodo_extensao );

CREATE INDEX Gerente_nome ON Produto( Nome );

CREATE INDEX Produto_nome ON Produto( Nome );

CREATE INDEX Vendedor_nome ON Vendedor( Nome );
CREATE INDEX Vendedor_produtividade ON Vendedor( Produtividade );

CREATE INDEX Venda_produto ON Venda( Cod_produto );
CREATE INDEX Venda_gerente ON Venda( Cod_gerente );
CREATE INDEX Venda_fornecedor ON Venda( Cod_fornecedor );
