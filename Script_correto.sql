ALTER TABLE ecommerce926.item_fornecedor ADD id_produto int4 NOT NULL;

-- Drop table

-- DROP TABLE ecommerce926.fornecedor;

CREATE TABLE ecommerce926.fornecedor (
	id serial4 NOT NULL,
	id_endereco int4 NOT NULL,
	cnpj bpchar(14) NOT NULL,
	nome varchar(895) NOT NULL,
	CONSTRAINT fornecedor_cnpj_key UNIQUE (cnpj),
	CONSTRAINT fornecedor_id_endereco_key UNIQUE (id_endereco),
	CONSTRAINT fornecedor_pkey PRIMARY KEY (id),
	CONSTRAINT fornecedor_id_endereco_fkey FOREIGN KEY (id_endereco) REFERENCES ecommerce926.endereco(id)
);

ALTER TABLE ecommerce926.endereco ADD id serial4 NOT NULL;

-- Drop table

-- DROP TABLE ecommerce926.item_carrinho;

CREATE TABLE ecommerce926.item_carrinho (
	id_cliente int4 NOT NULL,
	id_produto int4 NOT NULL,
	quantidade int4 NOT NULL,
	data_insercao timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT item_carrinho_pkey PRIMARY KEY (id_cliente, id_produto),
	CONSTRAINT item_carrinho_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES ecommerce926.cliente(id),
	CONSTRAINT item_carrinho_id_produto_fkey FOREIGN KEY (id_produto) REFERENCES ecommerce926.produto(id)
);

ALTER TABLE ecommerce926.cupom ADD limite_maximo_usos int4 NULL;

-- Drop table

-- DROP TABLE ecommerce926.item_pedido;

CREATE TABLE ecommerce926.item_pedido (
	id_pedido int4 NOT NULL,
	id_produto int4 NOT NULL,
	quantidade int4 NOT NULL,
	valor numeric NOT NULL,
	CONSTRAINT item_pedido_pkey PRIMARY KEY (id_pedido, id_produto),
	CONSTRAINT item_pedido_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES ecommerce926.pedido(id),
	CONSTRAINT item_pedido_id_produto_fkey FOREIGN KEY (id_produto) REFERENCES ecommerce926.produto(id)
);

ALTER TABLE ecommerce926.item_pedido ADD id_pedido int4 NOT NULL;

ALTER TABLE ecommerce926.pedido ADD status varchar(100) NOT NULL;

ALTER TABLE ecommerce926.item_carrinho ADD id_cliente int4 NOT NULL;

ALTER TABLE ecommerce926.cliente ADD id serial4 NOT NULL;

ALTER TABLE ecommerce926.cupom ADD data_inicio timestamp NOT NULL;

ALTER TABLE ecommerce926.produto ADD id serial4 NOT NULL;

ALTER TABLE ecommerce926.pedido ADD id_cupom int4 NULL;

ALTER TABLE ecommerce926.fornecedor ADD nome varchar(895) NOT NULL;

ALTER TABLE ecommerce926.fornecedor ADD cnpj bpchar(14) NOT NULL;

ALTER TABLE ecommerce926.cliente ADD nome varchar(895) NOT NULL;

ALTER TABLE ecommerce926.item_fornecedor ADD id_fornecedor int4 NOT NULL;

ALTER TABLE ecommerce926.endereco ADD numero varchar(30) NOT NULL;

ALTER TABLE ecommerce926.estoque ADD descricao varchar(1000) NOT NULL;

-- Drop table

-- DROP TABLE ecommerce926.cupom;

CREATE TABLE ecommerce926.cupom (
	id serial4 NOT NULL,
	descricao varchar(1000) NOT NULL,
	data_inicio timestamp NOT NULL,
	data_expiracao timestamp NOT NULL,
	valor numeric NOT NULL,
	limite_maximo_usos int4 NULL,
	CONSTRAINT cupom_pkey PRIMARY KEY (id)
);

ALTER TABLE ecommerce926.produto ADD valor numeric NOT NULL;

ALTER TABLE ecommerce926.item_carrinho ADD id_produto int4 NOT NULL;

ALTER TABLE ecommerce926.item_pedido ADD valor numeric NOT NULL;

ALTER TABLE ecommerce926.pedido ADD data_criacao timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE ecommerce926.cupom ADD descricao varchar(1000) NOT NULL;

ALTER TABLE ecommerce926.endereco ADD uf bpchar(2) NOT NULL;

ALTER TABLE ecommerce926.pedido ADD id_cliente int4 NOT NULL;

ALTER TABLE ecommerce926.pedido ADD previsao_entrega date NOT NULL;

ALTER TABLE ecommerce926.cliente ADD cpf bpchar(11) NOT NULL;

ALTER TABLE ecommerce926.item_carrinho ADD data_insercao timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE ecommerce926.item_estoque ADD quantidade int4 NOT NULL;

-- Drop table

-- DROP TABLE ecommerce926.estoque;

CREATE TABLE ecommerce926.estoque (
	id serial4 NOT NULL,
	id_endereco int4 NOT NULL,
	descricao varchar(1000) NOT NULL,
	CONSTRAINT estoque_id_endereco_key UNIQUE (id_endereco),
	CONSTRAINT estoque_pkey PRIMARY KEY (id),
	CONSTRAINT estoque_id_endereco_fkey FOREIGN KEY (id_endereco) REFERENCES ecommerce926.endereco(id)
);

ALTER TABLE ecommerce926.produto ADD codigo_barras varchar(44) NOT NULL;

-- Drop table

-- DROP TABLE ecommerce926.item_estoque;

CREATE TABLE ecommerce926.item_estoque (
	id_estoque int4 NOT NULL,
	id_produto int4 NOT NULL,
	quantidade int4 NOT NULL,
	CONSTRAINT item_estoque_pkey PRIMARY KEY (id_estoque, id_produto),
	CONSTRAINT item_estoque_id_estoque_fkey FOREIGN KEY (id_estoque) REFERENCES ecommerce926.estoque(id),
	CONSTRAINT item_estoque_id_produto_fkey FOREIGN KEY (id_produto) REFERENCES ecommerce926.produto(id)
);

-- Drop table

-- DROP TABLE ecommerce926.item_fornecedor;

CREATE TABLE ecommerce926.item_fornecedor (
	id_fornecedor int4 NOT NULL,
	id_produto int4 NOT NULL,
	CONSTRAINT item_fornecedor_pkey PRIMARY KEY (id_fornecedor, id_produto),
	CONSTRAINT item_fornecedor_id_fornecedor_fkey FOREIGN KEY (id_fornecedor) REFERENCES ecommerce926.fornecedor(id),
	CONSTRAINT item_fornecedor_id_produto_fkey FOREIGN KEY (id_produto) REFERENCES ecommerce926.produto(id)
);

-- Drop table

-- DROP TABLE ecommerce926.endereco;

CREATE TABLE ecommerce926.endereco (
	id serial4 NOT NULL,
	cep bpchar(8) NOT NULL,
	logradouro varchar(1000) NOT NULL,
	numero varchar(30) NOT NULL,
	cidade varchar(200) NOT NULL,
	uf bpchar(2) NOT NULL,
	CONSTRAINT pk_id_endereco PRIMARY KEY (id)
);

ALTER TABLE ecommerce926.endereco ADD cidade varchar(200) NOT NULL;

ALTER TABLE ecommerce926.estoque ADD id_endereco int4 NOT NULL;

ALTER TABLE ecommerce926.cupom ADD id serial4 NOT NULL;

ALTER TABLE ecommerce926.cupom ADD valor numeric NOT NULL;

ALTER TABLE ecommerce926.endereco ADD logradouro varchar(1000) NOT NULL;

ALTER TABLE ecommerce926.item_pedido ADD id_produto int4 NOT NULL;

ALTER TABLE ecommerce926.pedido ADD meio_pagamento varchar(200) NOT NULL;

ALTER TABLE ecommerce926.estoque ADD id serial4 NOT NULL;

ALTER TABLE ecommerce926.cliente ADD id_endereco int4 NOT NULL;

ALTER TABLE ecommerce926.cupom ADD data_expiracao timestamp NOT NULL;

ALTER TABLE ecommerce926.pedido ADD id serial4 NOT NULL;

ALTER TABLE ecommerce926.produto ADD descricao varchar(1000) NOT NULL;

-- Drop table

-- DROP TABLE ecommerce926.cliente;

CREATE TABLE ecommerce926.cliente (
	id serial4 NOT NULL,
	nome varchar(895) NOT NULL,
	id_endereco int4 NOT NULL,
	cpf bpchar(11) NOT NULL,
	CONSTRAINT cliente_cpf_key UNIQUE (cpf),
	CONSTRAINT cliente_id_endereco_key UNIQUE (id_endereco),
	CONSTRAINT cliente_pkey PRIMARY KEY (id),
	CONSTRAINT cliente_id_endereco_fkey FOREIGN KEY (id_endereco) REFERENCES ecommerce926.endereco(id)
);

-- Drop table

-- DROP TABLE ecommerce926.produto;

CREATE TABLE ecommerce926.produto (
	id serial4 NOT NULL,
	descricao varchar(1000) NOT NULL,
	codigo_barras varchar(44) NOT NULL,
	valor numeric NOT NULL,
	CONSTRAINT produto_pkey PRIMARY KEY (id),
	CONSTRAINT uk_produto_codigo_barras UNIQUE (codigo_barras)
);

ALTER TABLE ecommerce926.item_estoque ADD id_produto int4 NOT NULL;

ALTER TABLE ecommerce926.item_pedido ADD quantidade int4 NOT NULL;

ALTER TABLE ecommerce926.item_estoque ADD id_estoque int4 NOT NULL;

ALTER TABLE ecommerce926.item_carrinho ADD quantidade int4 NOT NULL;

ALTER TABLE ecommerce926.fornecedor ADD id serial4 NOT NULL;

ALTER TABLE ecommerce926.fornecedor ADD id_endereco int4 NOT NULL;

-- Drop table

-- DROP TABLE ecommerce926.pedido;

CREATE TABLE ecommerce926.pedido (
	id serial4 NOT NULL,
	previsao_entrega date NOT NULL,
	meio_pagamento varchar(200) NOT NULL,
	status varchar(100) NOT NULL,
	id_cliente int4 NOT NULL,
	data_criacao timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_cupom int4 NULL,
	CONSTRAINT pedido_id_cliente_id_cupom_key UNIQUE (id_cliente, id_cupom),
	CONSTRAINT pedido_pkey PRIMARY KEY (id),
	CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES ecommerce926.cliente(id),
	CONSTRAINT pedido_id_cupom_fkey FOREIGN KEY (id_cupom) REFERENCES ecommerce926.cupom(id)
);

ALTER TABLE ecommerce926.endereco ADD cep bpchar(8) NOT NULL;