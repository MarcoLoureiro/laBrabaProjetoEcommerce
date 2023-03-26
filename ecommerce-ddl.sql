create  table endereco ( 
	id                   serial  not null  ,
	cep                  char(8)  not null  ,
	logradouro           varchar(1000)  not null  ,
	numero               varchar(30) default 'sem número' not null  ,
	cidade               varchar(200)  not null  ,
	uf                   char(2)  not null  ,
	constraint pk_endereco primary key ( id )
 );

 --

create  table produto ( 
	id                   serial  not null  ,
	descricao            varchar(1000)  not null  ,
	codigo_barras        varchar(44)  not null  ,
	valor                numeric  not null  ,
	constraint pk_produto primary key ( id ),
	constraint unq_produto_codigo_barras unique ( codigo_barras ) 
 );

--

create  table cliente ( 
	id                   serial  not null  ,
	nome                 varchar(895)  not null  ,
	cpf                  char(11)  not null  ,
	id_endereco          integer  not null  ,
	constraint unq_cliente_cpf unique ( cpf ) ,
	constraint pk_cliente primary key ( id ),
	constraint unq_cliente_id_endereco unique ( id_endereco ) 
 );

alter table cliente add constraint fk_cliente_endereco foreign key ( id_endereco ) references endereco( id );

-- 

create  table carrinho ( 
	id                   serial  not null  ,
	id_produto           integer  not null  ,
	id_cliente           integer  not null  ,
	data_insercao        timestamp  not null  ,
	quantidade           integer  not null  ,
	constraint unq_carrinho_cliente unique ( id_cliente ) ,
	constraint pk_carrinho primary key ( id )
 );

alter table carrinho add constraint fk_carrinho_cliente foreign key ( id_cliente ) references cliente( id );

alter table carrinho add constraint fk_carrinho_produto foreign key ( id_produto ) references produto( id );

alter table carrinho drop constraint unq_carrinho_cliente;

--

create  table estoque ( 
	id                   serial  not null  ,
	id_endereco          integer  not null  ,
	id_produto           integer  not null  ,
	quantidade           integer  not null  ,
	constraint pk_estoque primary key ( id )
 );

alter table estoque add constraint fk_estoque_endereco foreign key ( id_endereco ) references endereco( id );

alter table estoque add constraint fk_estoque_produto foreign key ( id_produto ) references produto( id );

alter table estoque drop constraint unq_estoque_endereco;

-- 
create  table cupom ( 
	id                   serial  not null  ,
	data_expiracao       timestamp  not null  ,
	data_inicio          timestamp  not null  ,
	valor                numeric  not null  ,
	id_cliente           integer  not null  ,
	descricao            varchar(1000) default 'cupom sem descrição'   ,
	constraint pk_cupom primary key ( id )
 );

alter table cupom add constraint fk_cupom_cliente foreign key ( id_cliente ) references cliente( id );

-- 

create  table fornecedor ( 
	id                   integer  not null  ,
	cnpj                 char(14)  not null  ,
	nome                 varchar(895)  not null  ,
	id_endereco          integer  not null  ,
	id_produto           integer  not null  ,
	constraint unq_fornecedor_endereco unique ( id_endereco ) ,
	constraint pk_fornecedor primary key ( id ),
	constraint unq_fornecedor_cnpj unique ( cnpj ) 
 );

alter table fornecedor add constraint fk_fornecedor_endereco foreign key ( id_endereco ) references endereco( id );

alter table fornecedor add constraint fk_fornecedor_produto foreign key ( id_produto ) references produto( id );

alter table fornecedor drop constraint unq_fornecedor_endereco;

--

create  table pedido ( 
	id                   serial  not null  ,
	previsao_entrega     date  not null  ,
	meio_pagamento       varchar(200)  not null  ,
	status               varchar(100)  not null  ,
	id_cliente           integer  not null  ,
	data_criacao         timestamp  not null  ,
	id_cupom             integer  not null  ,
	constraint pk_pedidos primary key ( id ),
	constraint unq_pedido_cupom unique ( id_cupom ) 
 );

alter table pedido add constraint fk_pedido_cliente foreign key ( id_cliente ) references cliente( id );

alter table pedido add constraint fk_pedido_cupom foreign key ( id_cupom ) references cupom( id );

-- 

create  table item_pedido ( 
	id_pedido            integer  not null  ,
	id_produto           integer  not null  ,
	quantidade           integer  not null  ,
	valor                numeric  not null  ,
	constraint pk_item_pedido primary key ( id_pedido, id_produto )
 );

alter table item_pedido add constraint fk_item_pedido_pedido foreign key ( id_pedido ) references pedido( id ) on delete cascade;

alter table item_pedido add constraint fk_item_pedido_produto foreign key ( id_produto ) references produto( id );