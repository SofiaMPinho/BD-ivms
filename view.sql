CREATE VIEW Vendas(ean, cat, ano, trimestre, dia_mes, dia_semana, distrito, concelho, unidades)
AS
SELECT 
  produto.ean, 
  categoria.nome, 
  EXTRACT(YEAR FROM er.instante), 
  EXTRACT(QUARTER FROM er.instante), 
  EXTRACT(DAY FROM er.instante), 
  EXTRACT(DOW FROM er.instante), 
  pr.distrito, 
  pr.concelho, 
  er.unidades
FROM produto
INNER JOIN categoria ON (produto.cat = categoria.nome)
INNER JOIN evento_reposicao AS er ON (produto.ean = er.ean)
INNER JOIN instalada_em AS i ON (er.fabricante = i.fabricante)
INNER JOIN ponto_de_retalho AS pr ON (i.local = pr.nome);