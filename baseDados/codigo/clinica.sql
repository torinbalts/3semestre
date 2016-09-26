-- nome do ficheiro: clinica.sql 
-- Telmo Silva 
-- Data Criacao: 26/09/2016 

CREATE DATABASE clinica; USE clinica;

--TABELA ESPECIALIDADE
CREATE TABLE `especialidade`(
    
    `id_esp`        TINYINT(3) NOT NULL AUTO_INCREMENT,
    `designacao`    VARCHAR(40) NOT NULL,
    PRIMARY KEY(`id_esp`)

) ENGINE = INNODB DEFAULT CHARSET = latin1;


--TABELA PACIENTES
CREATE TABLE `pacientes` (
    
    `id_paciente`   TINYINT(3) NOT NULL AUTO_INCREMENT,
    `nome_paciente` VARCHAR(60) NOT NULL, 
    `morada`        VARCHAR(100),
    `contacto`      TINYINT(9),
    `cod_postal`    VARCHAR(8),

    PRIMARY KEY(`id_paciente`)

) ENGINE = INNODB DEFAULT CHARSET = latin1;


CREATE TABLE `medicos`(

    `id_medico`     TINYINT(3) NOT NULL AUTO_INCREMENT,
    `nome_medico`   VARCHAR(60) NOT NULL,
    `morada`        VARCHAR(100),
    `contacto`      TINYINT(9),
    `cod_postal`    VARCHAR(8),
    `celula`        VARCHAR(5),
    `id_esp`        TINYINT(3),

    PRIMARY KEY(`id_medico`),
    FOREIGN KEY(`id_esp`) REFERENCES `especialidades`(id_esp)

) 
