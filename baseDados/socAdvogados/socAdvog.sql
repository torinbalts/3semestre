-- Nome Ficheiro: socAdvog.sql
-- Data: 8/0/2016
-- Autor: Telmo Silva

CREATE DATABASE sociedade_advogados;
USE sociedade_advogados;

CREATE TABLE `clientes` 
(
    `id_cliente` TINYINT(3) NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(40) NOT NULL,
    PRIMARY KEY(`id_cliente`)
    
) ENGINE = INNODB DEFAULT CHARSET = latin1;


CREATE TABLE `tribunais` 
(
    `id_tribunal` TINYINT(1) NOT NULL AUTO_INCREMENT,
    `designacao` VARCHAR(20) NOT NULL,
    PRIMARY KEY(`id_tribunal`)

) ENGINE = INNODB DEFAULT CHARSET = latin1;


CREATE TABLE `consultas` 
(
    `id_consulta` SMALLINT(4) NOT NULL AUTO_INCREMENT,
    `id_cliente` TINYINT(3),
    `data` DATE,
    `resumo` VARCHAR(200),
    PRIMARY KEY(`id_consulta`),
    FOREIGN KEY(`id_cliente`) REFERENCES clientes(`id_cliente`)
    
) ENGINE = INNODB DEFAULT CHARSET = latin1;


CREATE TABLE `processos` 
(
    `id_processo` TINYINT(3) NOT NULL AUTO_INCREMENT,
    `id_cliente` TINYINT(3),
    `id_tribunal` TINYINT(1),
    `data_inicio` DATE,
    `data_fim` DATE,
    `requerimento` VARCHAR(200),
    `pet_inicial` VARCHAR(200),
    `contestacao` VARCHAR(200),
    `reu` VARCHAR(250),
    PRIMARY KEY(`id_processo`),
    FOREIGN KEY(`id_cliente`) REFERENCES clientes(`id_cliente`),
    FOREIGN KEY(`id_tribunal`) REFERENCES tribunais(`id_tribunal`)

) ENGINE = INNODB DEFAULT CHARSET = latin1;


CREATE TABLE `hon_processos` 
(
    `id_hon_processos` TINYINT(3) NOT NULL AUTO_INCREMENT,
    `id_processo` TINYINT(3),
    `des_servico` VARCHAR(100),
    `preco` DECIMAL(5,2),
    PRIMARY KEY(`id_hon_processos`),
    FOREIGN KEY(`id_processo`) REFERENCES processos(`id_processo`)

) ENGINE = INNODB DEFAULT CHARSET = latin1;


CREATE TABLE `hon_consultas` 
(
    `id_hon_consulta` SMALLINT(4) NOT NULL AUTO_INCREMENT,
    `id_consulta` SMALLINT(4),
    `des_servico` VARCHAR(100),
    `preco` DECIMAL(5,2),
    PRIMARY KEY(`id_hon_consulta`),
    FOREIGN KEY(`id_consulta`) REFERENCES consultas(`id_consulta`)

) ENGINE = INNODB DEFAULT CHARSET = latin1;
