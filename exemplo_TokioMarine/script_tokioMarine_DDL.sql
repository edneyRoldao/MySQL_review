drop table if exists CLIENTE;
drop table if exists DEPENDENTE;
drop table if exists GRAU_PARENTESCO;

create table CLIENTE (
	nome varchar(50) not null,
    id_cliente int unsigned not null auto_increment primary key
);

create table DEPENDENTE (
	nome varchar(50) not null,
    id_dependente int unsigned not null auto_increment primary key
);

create table GRAU_PARENTESCO (
	descricao varchar(50) not null,
    id_cliente int unsigned not null,
    id_dependente int unsigned not null,
    primary key(id_cliente, id_dependente)
);