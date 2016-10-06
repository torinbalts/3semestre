-- file name: sqlCode.sql
-- date creation: 6/10/2016
-- author: Telmo Silva


CREATE DATABASE sociedadeAdvogados;

-- TABLE LAWYER
CREATE TABLE `lawyer`:
(
    `id_lawyer`     TINYINT(3) NOT NULL AUTO_INCREMENT,
    `name`          VARCHAR(40) NOT NULL,

    PRIMARY KEY(`id_lawyer`)
)   ENGINE = INNODB DEFAULT CHARSET = latin1;

-- TABLE CLIENT
CREATE TABLE `client`
(
    `id_client`     SMALLINT(3) NOT NULL AUTO_INCREMENT,
    `id_lawyer`     TINYINT(3),
    `name`          VARCHAR(40) NOT NULL,

    PRIMARY KEY(`id_client`),
    FOREIGN KEY(`id_lawyer`) REFERENCES lawyer(`id_lawyer`)
) ENGINE = INNODB DEFAULT CHARSET = latin1;

-- TABLE CONSULTATION
CREATE TABLE `consultation`
(
    `id_cons`       SMALLINT(5) NOT NULL AUTO_INCREMENT,
    `id_client`     SMALLINT(3),
    `id_lawyer`     TINYINT(3),
    `id_trial`      TINYINT(3),
    `id_cons_fee`   SMALLINT(5),
    `id_cons_act`   TINYINT(3),
    `summary`       VARCHAR(40),

    PRIMARY KEY (`id_cons`),
    FOREIGN KEY (`id_client`) REFERENCES client(`id_client`),
    FOREIGN KEY (`id_lawyer`) REFERENCES lawyer(`id_lawyer`),
    FOREIGN KEY (`id_trial`) REFERENCES trial(`id_trial`),
    FOREIGN KEY (`id_cons_fee`) REFERENCES cons_fee(`id_cons_fee`),
) ENGINE = INNODB DEFAULT CHARSET = latin1;
    
-- TABLE CONSULTATION FEE
CREATE TABLE `cons_fee`
(
    `id_cons_fee`   SMALLINT(5) NOT NULL AUTO_INCREMENT,
    `cons_fee`      DECIMAL(5,2),
    `id_fee_review` TINYINT(3),

    PRIMARY KEY (`id_cons_fee`),
    FOREIGN KEY (`id_fee_review`) REFERENCES fee_review(`id_fee_review`)
) ENGINE = INNODB DEFAULT CHARSET = latin1;
