CREATE TABLE `especialidades`
(
    `id_esp` TINYINT(3) NOT NULL AUTO_INCREMENT,
    `designacao` VARCHAR(40) NOT NULL,

    PRIMARY KEY (`id_esp`)
) ENGINE = INNODB DEFAULT CHARSET = latin1;

CREATE TABLE `medicos`
(
    `id_medico` TINYINT(3) NOT NULL AUTO_INCREMENT,
    `id_esp` TINYINT(3), 
    `nome_medico` VARCHAR(40) NOT NULL,

    PRIMARY KEY(`id_medico`),
    FOREIGN KEY(`id_esp`) REFERENCES especialidades(`id_esp`)
) ENGINE = INNODB DEFAULT CHARSET = latin1;

CREATE TABLE `pacientes`
(
    `id_paciente` TINYINT(3) NOT NULL AUTO_INCREMENT,
    `nome_paciente` VARCHAR(40) NOT NULL,

    PRIMARY KEY (`id_paciente`)

) ENGINE = INNODB DEFAULT CHARSET = latin1;

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

CREATE TABLE `exames_comp`
(
    `id_exame` TINYINT(3) NOT NULL AUTO_INCREMENT,
    `descricao` VARCHAR(40),

    PRIMARY KEY (`id_exame`)
) ENGINE = INNODB DEFAULT CHARSET = latin1;

-- INSERT INTO especialidades VALUES (2, "Cardiologia"),(3, "Ortopedia"),(4, "Neurologia"),(5, "Cirurgia");

-- UPDATE especialidades SET designacao="Medicina Interna" WHERE id_esp=5;
