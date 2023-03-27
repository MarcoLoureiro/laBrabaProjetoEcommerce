select * from cliente c;

select * from endereco e;

select * from produto p;

select * from carrinho ca;

select * from cupom cp;

select * from pedido pe;

select * from fornecedor f;

select * from estoque es;

select * from item_pedido ip;

insert into endereco values
	(default, '47802446', 'Rua Pastor Paulo Leivas Macalão, Bandeirantes', '53', 'Barreiras', 'BA'), 
	(default, '69918452', 'Rua Luiz Z da Silva, Conjunto Manoel Julião', '122', 'Rio Branco', 'AC'), 
	(default, '49044328', 'Rua Luiz Nunes Góis, Santa Maria', '621', 'Aracaju', 'SE'),
	(default, '55643616', 'Alameda São Bento, São José', '473', 'Gravatá', 'PE'),
	(default, '60355090', 'Travessa Maria Lenice, Presidente Kennedy', '125', 'Fortaleza', 'CE'),
	(default, '78705882', 'Rua Rio Grande do Sul, Jardim Novo Horizonte', '76', 'Rondonópolis', 'MT'),
	(default, '88067377', 'Passagem das Magnetitas, Pântano do Sul', '198', 'Florianópolis', 'SC'),
	(default, '69400857', 'Rua Vitória, São José', '78', 'Manacapuru', 'AM'), -- Aqui estoque
	(default, '69307772', 'Rua da Gravioleira, Caçari', '22', 'Boa Vista', 'RR'), -- Aqui estoque
	(default, '79321280', 'Rua República do Paraguai, Popular Nova', '348', 'Corumbá', 'MS'), -- Aqui fornecedor
	(default, '59065090', 'Rua Carlos Gomes, Candelária', '51', 'Natal', 'RN'); -- Aqui fornecedor

	
insert into produto values
	(default,'Shampoo Palmolive Naturals 350ml','ABC12345', 10.89),
	(default,'Sabonete Dove barra 90g','ABC54321', 3.94),
	(default,'Condicionador Elseve Reparação Total 400ml','CBA12345', 15.97),
	(default,'Perfume Bleu De Chanel 100ml','CBA54321', 547.60),
	(default,'Escova de Cabelo Raquete','ABC12343', 14.99),
	(default,'Grampo de Cabelo Número 5 24un','CBA22343', 1.98);


insert into estoque values
(default,8,1,50),
(default,8,2,80),
(default,8,3,30),
(default,9,4,120),
(default,9,5,150),
(default,9,6,10);

insert into fornecedor values
(1,'12345678912345','Unilever',10,1),
(2,'12345678912346','Unilever',10,2),
(3,'12345678912347','Unilever',10,3),
(4,'12345678912348','Skala',11,4),
(5,'12345678912349','Skala',11,5),
(6,'12345678912344','Skala',11,6);


insert into cliente values
	(default,'Ana Maria Braga','46487383066', 1),
	(default,'João Guilherme','19654147025',2),
	(default,'Pedro Tony','76600343087', 3),
	(default,'Vinicius Coronel','18223551098', 4),
	(default,'Mayara Silva','76496056048', 5),
	(default,'Cleiton Henrique','25102409000' ,6),
	(default,'Junior Moreira','77760751087', 7);

	
insert into carrinho values
	(default,1,1,'2023-03-25',3),
	(default,2,1,'2023-03-25',5),
	(default,3,1,'2023-03-25',1),
	(default,3,2,'2023-02-25',2),
	(default,4,2,'2023-02-25',3),
	(default,5,2,'2023-02-25',11);

insert into cupom values
(default,'2023-04-27','2023-03-26',10,1,'Cupom de 10R$'),
(default,'2023-04-27','2023-03-26',30,2,'Cupom de 30R$'),
(default,'2023-04-27','2023-03-26',100,3,'Cupom de 100R$'),
(default,'2023-01-01','2023-01-01',0,1,'Sem cupom'),
(default,'2023-01-01','2023-01-01',0,1,'Sem cupom'),
(default,'2023-01-01','2023-01-01',0,1,'Sem cupom');

insert into pedido values
	(default,'2023-04-05','Pix','Enviado',1,'2023-03-25',1),
	(default,'2023-04-20','Pix','Enviado',2,'2023-04-02',2),
	(default,'2023-04-22','Pix','Enviado',2,'2023-04-28',3);
	(default,'2023-04-05','Cartão','Atrasado',1,'2023-03-25',4),
	(default,'2023-02-03','Dinheiro','Recebido',1,'2023-02-01',5),
	(default,'2023-03-02','Cartão','Atrasado',1,'2023-03-01',6);

delete * from cliente c
left join pedido pe
on pe.id_cliente  = c.id 
left join carrinho ca
on ca.id_cliente = c.id
where pe.id_cliente is null and ca.id_cliente is null
and c.id = 3;



update produto set descricao = 'Shampoo Palmolive Naturals 550ml', valor = 10.22 where id = 1;


	
