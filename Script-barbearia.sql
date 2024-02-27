/*drop database redeSocial;*/

create database barbearia;

use barbearia;

create table adm (
id int not null auto_increment,
nome varchar(120) not null,
email varchar(120) not null unique,
cpf varchar(11) not null,
password varchar(255),
primary key(id)
);

create table profissionais (
id int not null auto_increment,
nome varchar(120) not null,
celular varchar(11),
email varchar(120) not null unique,
cpf varchar(11) not null,
dataNascimento datetime not null,
cidade varchar(120) not null,
estado varchar(2) not null,
pais varchar(80) not null,
rua varchar(120) not null,
numero varchar(10) not null,
bairro varchar(100) not null,
cep varchar(8) not null,
complemento varchar(500),
salario decimal(15,2),
password varchar(255),
primary key(id)
);

create table clientes (
id int not null auto_increment,
nome varchar(120) not null,
celular varchar(11),
email varchar(120) not null unique,
cpf varchar(11) not null,
dataNascimento datetime not null,
cidade varchar(120) not null,
estado varchar(2) not null,
pais varchar(80) not null,
rua varchar(120) not null,
numero varchar(10) not null,
bairro varchar(100) not null,
cep varchar(8) not null,
complemento varchar(500),
password varchar(255),
primary key(id)
);

create table tipo_pagamento (
id int not null auto_increment,
nome varchar(45) not null unique,
taxa decimal(15,2) not null,
status varchar(20) not null,
primary key(id)
);

create table servicos (
id int not null auto_increment,
nome varchar(45) not null unique,
duracao int not null,
descricao varchar(200) not null,
preco decimal(15,2) not null,
profissionais_id int not null,
primary key(id),
constraint fk_servicos_profissionais
	foreign key(profissionais_id)
	references profissionais (id)
);

create table agenda (
id int not null auto_increment,
dataHora datetime not null,
clientes_id int not null,
tipo_pagamento_id int not null,
servicos_id int not null,
profissionais_id int not null,
primary key(id),
constraint fk_agenda_clientes
	foreign key(clientes_id)
	references clientes (id),
constraint fk_agenda_tipo_pagamento
	foreign key(tipo_pagamento_id)
	references tipo_pagamento (id),
constraint fk_agenda_servicos
	foreign key(servicos_id)
	references servicos (id),
constraint fk_agenda_profissionais
	foreign key(profissionais_id)
	references profissionais (id)
);
