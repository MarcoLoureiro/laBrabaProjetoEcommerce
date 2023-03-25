create table produto(
    id serial primary key,
    descricao varchar(1000) not null,
    codigo_barras varchar(44) not null,
    valor numeric not null
);

alter table produto add constraint 
  uk_produto_codigo_barras unique(codigo_barras);

create table endereco(
    id serial,
    cep char(8) not null,
    logradouro varchar(1000) not null,
    numero varchar(30) not null,
    cidade varchar(200) not null,
    uf char(2) not null,
    constraint pk_id_endereco primary key(id)
);


create table cliente(
    id serial primary key,
    nome varchar(895) not null,
    id_endereco int
);


alter table cliente 
  add column cpf char(11) unique;
 

 alter table cliente
     add UNIQUE(id_endereco);
    
 
 alter table cliente
    alter column id_endereco set not null;
   

 alter table cliente
    alter column cpf set not null; 
   

alter table cliente
    add foreign key (id_endereco) references endereco(id);
   

create table pedido (
    id serial primary key,
    previsao_entrega date not null,
    meio_pagamento varchar(200) not null,
    status varchar(100) not null,
    id_cliente int not null,
    data_criacao timestamp not null,
    foreign key(id_cliente) references cliente
);


create table item_pedido(
    id_pedido int not null,
    id_produto int not null,
    quantidade int not null,
    valor numeric not null,
    primary key(id_pedido, id_produto),
    foreign key(id_pedido) references pedido(id),
    foreign key(id_produto) references produto
);


 -- Alterações feitas para a tarefa 
create table cupom ( 
	id serial not null,
	data_expiracao timestamp  not null,
	data_inicio timestamp  not null,
	valor numeric  not null,
	id_cliente integer  not null,
	descricao varchar(1000) default 'cupom sem descrição',
	constraint pk_cupom primary key (id)
 );


alter table cupom add constraint fk_cupom_cliente foreign key (id_cliente) references cliente(id);


create table fornecedor ( 
	id integer not null,
	cnpj char(14) not null,
	nome varchar(895) not null,
	id_endereco integer not null,
	id_produto integer not null,
	constraint unq_fornecedor_endereco unique (id_endereco),
	constraint pk_fornecedor primary key (id),
	constraint unq_fornecedor_cnpj unique (cnpj) 
 );


alter table fornecedor add constraint fk_fornecedor_endereco foreign key (id_endereco) references endereco(id);

alter table fornecedor add constraint fk_fornecedor_produto foreign key (id_produto) references produto(id);

create table estoque ( 
	id serial not null,
	id_endereco integer not null,
	id_produto integer not null,
	quantidade integer not null,
	constraint pk_estoque primary key (id),
	constraint unq_estoque_endereco unique ( id_endereco ) 
 );

alter table estoque add constraint fk_estoque_endereco foreign key (id_endereco) references endereco(id);

alter table estoque add constraint fk_estoque_produto foreign key (id_produto) references produto(id);

create table carrinho ( 
	id serial not null,
	id_produto integer not null,
	id_cliente integer not null,
	data_insercao timestamp not null,
	constraint unq_carrinho_cliente unique (id_cliente),
	constraint pk_carrinho primary key (id)
 );

alter table carrinho add constraint fk_carrinho_cliente foreign key (id_cliente) references cliente(id);

alter table carrinho add constraint fk_carrinho_produto foreign key (id_produto) references produto(id);


alter table item_pedido  
add column id_cupom integer not null;

alter table item_pedido add constraint fk_item_pedido_cupom foreign key 
(id_cupom) references cupom(id);
