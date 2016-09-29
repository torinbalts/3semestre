-- nome ficheiro = clinica.sql
-- autor Telmo Silva
-- data 29/9/2016


-- TABELA ESPECIALIDADES
CREATE TABLE `especialidades`
(
    `id_esp` TINYINT(3) NOT NULL AUTO_INCREMENT,
    `designacao` VARCHAR(40) NOT NULL,

    PRIMARY KEY (`id_esp`)
) ENGINE = INNODB DEFAULT CHARSET = latin1;

-- TABELA MEDICOS
CREATE TABLE `medicos`
(
    `id_medico` TINYINT(3) NOT NULL AUTO_INCREMENT,
    `id_esp` TINYINT(3), 
    `nome_medico` VARCHAR(40) NOT NULL,

    PRIMARY KEY(`id_medico`),
    FOREIGN KEY(`id_esp`) REFERENCES especialidades(`id_esp`)
) ENGINE = INNODB DEFAULT CHARSET = latin1;

-- TABELA PACIENTES
CREATE TABLE `pacientes`
(
    `id_paciente` TINYINT(3) NOT NULL AUTO_INCREMENT,
    `nome_paciente` VARCHAR(40) NOT NULL,

    PRIMARY KEY (`id_paciente`)

) ENGINE = INNODB DEFAULT CHARSET = latin1;

-- TABELA CONSULTAS
CREATE TABLE `consultas`
(
    `id_consulta` TINYINT(3) NOT NULL AUTO_INCREMENT,
    `id_medico` TINYINT(3),
    `id_paciente` TINYINT(3),
    `id_exame` TINYINT(3) NULL,
    `data_consulta` DATE,
    `hora_consulta` TIME,
    `preco` DECIMAL(5,2),

    PRIMARY KEY (`id_consulta`),
    FOREIGN KEY (`id_medico`) REFERENCES medicos(`id_medico`),
    FOREIGN KEY (`id_paciente`) REFERENCES pacientes(`id_paciente`),
    FOREIGN KEY (`id_exame`) REFERENCES exames_comp(`id_exame`)

) ENGINE = INNODB DEFAULT CHARSET = latin1;

-- TABELA EXAMES
CREATE TABLE `exames_comp`
(
    `id_exame` TINYINT(3) NOT NULL AUTO_INCREMENT,
    `descricao` VARCHAR(40),

    PRIMARY KEY (`id_exame`)
) ENGINE = INNODB DEFAULT CHARSET = latin1;
