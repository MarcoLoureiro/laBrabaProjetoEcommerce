-- 1
select * from cliente c
where nome ilike 'ANA%';

-- 2
select * from pedido p 
where data_criacao between '2023-01-01' and '2023-31-12'
order by data_criacao desc;

-- 3
select * from pedido p
where to_char(p.data_criacao, 'Month') = 'January  ';

-- 4 
select * from item_pedido ip 
where valor > 2 and valor < 5;

-- 5
select * from produto p
where valor = (select max(valor) from produto p2);

-- 6
select distinct(p.status) from pedido p;

-- 7
select max(valor) as maior_valor, min(valor) as menor_valor,avg(valor) as media from produto p;

-- 8
select f.nome as nome_fornecedor, f.cnpj as cnpj_fornecedor,e.logradouro, e.numero as numero_endereco_fornecedor, e.cidade, e.uf from fornecedor f
inner join endereco e on e.id = f.id_endereco;

-- 9
select e.id,p.descricao,ie.quantidade,en.logradouro, en.numero, en.cidade, en.uf from produto p
inner join item_estoque ie on ie.id_produto = p.id
inner join estoque e on ie.id_estoque = e.id
inner join endereco en on en.id = e.id_endereco;

 -- 10 
select sum(ie.quantidade) as quantidade_total,p.descricao, p.codigo_barras from produto p
inner join item_estoque ie on ie.id_produto = p.id
group by p.id
order by p.id;

-- 11
select p.descricao, ic.quantidade, p.valor from cliente c
inner join item_carrinho ic on ic.id_cliente = c.id
inner join produto p on ic.id_produto = p.id
where c.cpf = '26382080861';

-- 12
select ic.id_cliente, c.nome, c.cpf, count(distinct  ic.id_produto) as qtd_produtos
from item_carrinho ic
join cliente c on ic.id_cliente = c.id
group by ic.id_cliente, c.nome, c.cpf
order by qtd_produtos desc;

-- 13
SELECT p.id AS id_produto, p.descricao AS descricao_produto, ic.data_insercao, ic.id_cliente, c.nome
FROM item_carrinho ic
JOIN produto p ON ic.id_produto = p.id
JOIN cliente c ON ic.id_cliente = c.id
WHERE ic.data_insercao < NOW() - INTERVAL '10 months'
ORDER BY ic.data_insercao;

-- 14
select e.uf, count(c.id) from cliente c
inner join endereco e on c.id_endereco = e.id
group by e.uf;

-- 15
select e.uf, count(c.id) from cliente c
inner join endereco e on c.id_endereco = e.id
group by e.uf
order by count(c.id) desc;

-- 16
select  c.nome as nome_cliente, p.id as id_pedido, p.previsao_entrega, p.status,
       pr.descricao as descricao_produto, ip.quantidade, ip.valor
from pedido p
join cliente c on p.id_cliente = c.id
join item_pedido ip on p.id = ip.id_pedido
join produto pr on ip.id_produto = pr.id
where p.id = 952;

-- 17
select c.id,c.nome,max(p.data_criacao) from cliente c
inner join pedido p on p.id_cliente = c.id
where to_char(p.data_criacao, 'YYYY') = '2022'
group by c.id;

-- 18
select a.nome, max(valor_gasto) valor_max from (
select c.id, c.nome, sum(ip.quantidade * ip.valor) "valor_gasto" from cliente c 
inner join pedido p on p.id_cliente = c.id
inner join item_pedido ip on ip.id_pedido = p.id 
where p.status not in ('PENDENTE_CONFIRMACAO_PAGAMENTO','CANCELADO')
and to_char(p.data_criacao, 'YYYY') = '2023'
group by c.id, c.nome, p.id
having sum(ip.quantidade * ip.valor) > 10000) as a
group by a.id, a.nome
order by valor_max desc
limit 10;

-- 19
select p.descricao, sum(ip.quantidade * ip.valor) "valor_vendido" from produto p
inner join item_pedido ip on ip.id_produto = p.id
inner join pedido pe on ip.id_pedido = pe.id
where to_char(pe.data_criacao, 'YYYY') = '2023'
group by p.descricao
order by valor_vendido desc
limit 10;

-- 20
select sum(ip.quantidade * ip.valor) / count(p.id) "ticket médio" from pedido p
inner join item_pedido ip on ip.id_pedido = p.id
where p.status = ('SUCESSO');

-- 21
select a.id, a.nome, max(valor_gasto) maior_valor_gasto from (
select c.id, c.nome, sum(ip.quantidade * ip.valor) "valor_gasto" from cliente c 
inner join pedido p on p.id_cliente = c.id
inner join item_pedido ip on ip.id_pedido = p.id 
where p.status not in ('PENDENTE_CONFIRMACAO_PAGAMENTO','CANCELADO')
group by c.id, c.nome, p.id
having sum(ip.quantidade * ip.valor) > 10000) as a
group by a.id,a.nome
order by maior_valor_gasto desc;

-- 22
select c.id, c.descricao, count(p.id_cupom) "qnt_cupom_utilizado", c.valor * count(p.id_cupom) as "total_descontado" from pedido p
inner join cupom c on p.id_cupom = c.id 
group by distinct c.id, p.id_cupom
order by qnt_cupom_utilizado desc
limit 10;

-- 23
select c.descricao, c.valor, c.limite_maximo_usos, count(p.id_cupom) as numero_de_usos from cupom c
inner join pedido p on p.id_cupom = c.id
group by c.id
having count(p.id_cupom) > c.limite_maximo_usos;

-- 24
select p.id from pedido p
inner join item_pedido ip on ip.id_pedido = p.id 
inner join produto pro on ip.id_produto = pro.id 
inner join cliente c on p.id_cliente = c.id
inner join endereco e on c.id_endereco = e.id
where e.uf = 'SP' and pro.codigo_barras = '97692630963921';

