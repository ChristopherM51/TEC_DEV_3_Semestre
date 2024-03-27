create database aula_sql;
drop database aula_sql;

-- criar banco de dados
CREATE DATABASE DB_AULA25MAR24;
-- criar tabela
USE DATABASE DB_AULA25MAR24;

create table if not exists Fornecedor (
    Fcodigo int not null,
    Fnome Varchar(30) not null,
    Status int,
    cidade varchar(30)
);

create table if not exists Departamento (
    Dcodigo int not null,
    Dnome Varchar(30) not null,
    cidade varchar(30),
    PRIMARY key(Dcodigo)
);

create table if not exists Empregado (
    Ecodigo int not null,
    Enome Varchar(40) not null,
    CPF varchar(15) NOT NULL,
    SALARIO DECIMAL (7,2),
    Dcodigo int not null,
    PRIMARY key(Dcodigo, Enome),
    foreign key(Dcodigo) references departamento
);

-- adicionar coluna
alter table Empregado ADD sexo char(1);
-- drop coluna
alter table Empregado drop sexo;
-- alterar nome da tabela
alter table funbcionario rename to funcionario;
-- alterar nome do campo de dado
alter table fornecedor alter column status type ativo boolean;

select * from fornecedor;

drop table empregado;