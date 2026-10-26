-- Exercise 1 — Orders, articles, factories, and delivery addresses
-- MySQL 8.4
-- Source basis: the supplied "Ejercicio 1 — Modelo relacional" material.
-- The source defines entities, attributes, PKs/FKs and relationships, but not SQL data types.
-- Data types below are implementation choices and can be adjusted to the instructor's requirements.

CREATE DATABASE IF NOT EXISTS cifo_exercise_1;
USE cifo_exercise_1;

CREATE TABLE IF NOT EXISTS cliente (
    id_cliente INT UNSIGNED NOT NULL,
    saldo DECIMAL(12,2) NULL,
    credito DECIMAL(12,2) NULL,
    dcto DECIMAL(5,2) NULL,
    CONSTRAINT pk_cliente PRIMARY KEY (id_cliente)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS direccion_envio (
    id_direccion INT UNSIGNED NOT NULL,
    calle VARCHAR(150) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    codigo_postal VARCHAR(15) NULL,
    dcto DECIMAL(5,2) NULL,
    CONSTRAINT pk_direccion_envio PRIMARY KEY (id_direccion)
) ENGINE=InnoDB;

-- Resolves the N:M relationship between customers and delivery addresses.
CREATE TABLE IF NOT EXISTS cliente_direccion (
    id_cliente INT UNSIGNED NOT NULL,
    id_direccion INT UNSIGNED NOT NULL,
    CONSTRAINT pk_cliente_direccion PRIMARY KEY (id_cliente, id_direccion),
    CONSTRAINT fk_cliente_direccion_cliente
        FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    CONSTRAINT fk_cliente_direccion_direccion
        FOREIGN KEY (id_direccion) REFERENCES direccion_envio (id_direccion)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS pedido (
    id_pedido INT UNSIGNED NOT NULL,
    hora TIME NULL,
    fecha DATE NULL,
    id_cliente INT UNSIGNED NOT NULL,
    id_direccion INT UNSIGNED NOT NULL,
    CONSTRAINT pk_pedido PRIMARY KEY (id_pedido),
    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    CONSTRAINT fk_pedido_direccion
        FOREIGN KEY (id_direccion) REFERENCES direccion_envio (id_direccion)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS fabrica (
    num INT UNSIGNED NOT NULL,
    telefono VARCHAR(30) NULL,
    tipo_fabrica VARCHAR(100) NULL,
    CONSTRAINT pk_fabrica PRIMARY KEY (num)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS articulo (
    id_articulo INT UNSIGNED NOT NULL,
    descripcion_articulo VARCHAR(255) NOT NULL,
    CONSTRAINT pk_articulo PRIMARY KEY (id_articulo)
) ENGINE=InnoDB;

-- Resolves the N:M relationship between factories and articles.
CREATE TABLE IF NOT EXISTS fabrica_articulo (
    num_fabrica INT UNSIGNED NOT NULL,
    id_articulo INT UNSIGNED NOT NULL,
    CONSTRAINT pk_fabrica_articulo PRIMARY KEY (num_fabrica, id_articulo),
    CONSTRAINT fk_fabrica_articulo_fabrica
        FOREIGN KEY (num_fabrica) REFERENCES fabrica (num),
    CONSTRAINT fk_fabrica_articulo_articulo
        FOREIGN KEY (id_articulo) REFERENCES articulo (id_articulo)
) ENGINE=InnoDB;

-- Each row represents an article and quantity within an order.
CREATE TABLE IF NOT EXISTS detalle_pedido (
    id_pedido INT UNSIGNED NOT NULL,
    id_articulo INT UNSIGNED NOT NULL,
    cantidad INT UNSIGNED NOT NULL,
    CONSTRAINT pk_detalle_pedido PRIMARY KEY (id_pedido, id_articulo),
    CONSTRAINT fk_detalle_pedido_pedido
        FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
    CONSTRAINT fk_detalle_pedido_articulo
        FOREIGN KEY (id_articulo) REFERENCES articulo (id_articulo)
) ENGINE=InnoDB;

-- Review before implementation:
-- The source diagram includes an N:M customer-address relationship and also
-- references a delivery address from PEDIDO. This script preserves both relations.
-- No sample data is inserted; the script only creates the schema.
