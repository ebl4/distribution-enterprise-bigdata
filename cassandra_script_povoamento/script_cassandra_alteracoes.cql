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
