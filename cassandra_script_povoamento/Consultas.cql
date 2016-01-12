--Inserção, atualização e deleção de dados
INSERT INTO Venda (Cod_venda, Cod_gerente, Cod_Produto, Cod_fornecedor, DateKey, Valor_Venda) VALUES ('1001', '10000001100', '1', '10000001100', '2006-12-13', 66.54);
UPDATE Venda SET Valor_Venda = 6000.54;
DELETE FROM Venda WHERE Cod_venda = 1001;

-- Consultando detalhes de um produto que sabemos o código
SELECT * FROM Produto WHERE Cod_produto = '5';

-- Consultando detalhes de um produto que sabemos apenas o nome
SELECT * FROM Produto WHERE Nome = 'Doral';

-- Consultando o nome e descrição dos 10 produtos mais caros
SELECT Nome, Descricao, Preco FROM Produto ORDER BY Preco LIMIT 10;

-- Consultando o período de extensão da garantia de vários produtos que sabemos o código
PAGING OFF
SELECT Periodo_extensao, Cod_produto FROM Garantia WHERE Cod_produto IN ('1','2','3','5');

-- Consultando a média de preços dos produtos
SELECT average(Preco) FROM Produto;

-- Consultando a quantidade total de fornecedores com reputação boa ou ótima
PAGING OFF
SELECT count(CNPJ) FROM Fornecedor WHERE Reputacao IN ('Bom', 'Ótimo');

-- Consultando a quantidade total de fornecedores para cada tipo de reputação
SELECT group_and_count(Reputacao) FROM Fornecedor;

-- Consultando o valor total vendido por fornecedores diferentes
SELECT group_and_count(Cod_fornecedor, Valor_venda) FROM Venda;

-- Consultando o valor total vendido para cada produto diferente
SELECT group_and_count(Cod_produto, Valor_venda) FROM Venda;

-- Consultando todas as vendas para certo produto e fornecedor
SELECT * FROM Venda 
      WHERE Cod_Produto = '1' AND Cod_fornecedor = '10000001100' 
      ALLOW FILTERING ;
