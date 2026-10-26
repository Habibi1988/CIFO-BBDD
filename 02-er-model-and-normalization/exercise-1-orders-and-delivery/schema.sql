-- Exercise 1 — Artículos y encargos (Articles and Orders)
-- MySQL 8.4
-- Based on the official exercise statement (Ejercicios Modelo Entidad/Relación).
-- Data types and identifiers are implementation choices where the prompt is silent.

CREATE DATABASE IF NOT EXISTS cifo_exercise_1;
USE cifo_exercise_1;

CREATE TABLE IF NOT EXISTS cliente (
    numero_cliente INT UNSIGNED NOT NULL,
    saldo DECIMAL(14,2) NOT NULL DEFAULT 0,
    limite_credito DECIMAL(14,2) NOT NULL DEFAULT 0,
    descuento DECIMAL(5,2) NOT NULL DEFAULT 0,
    CONSTRAINT pk_cliente PRIMARY KEY (numero_cliente),
    CONSTRAINT chk_cliente_limite_credito CHECK (limite_credito >= 0 AND limite_credito <= 3000000.00),
    CONSTRAINT chk_cliente_descuento CHECK (descuento >= 0 AND descuento <= 100)
) ENGINE=InnoDB;

-- One customer can have several shipping addresses.
CREATE TABLE IF NOT EXISTS direccion_envio (
    id_direccion INT UNSIGNED NOT NULL AUTO_INCREMENT,
    numero_cliente INT UNSIGNED NOT NULL,
    calle VARCHAR(150) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    codigo_postal VARCHAR(15) NOT NULL,
    CONSTRAINT pk_direccion_envio PRIMARY KEY (id_direccion),
    CONSTRAINT uq_direccion_cliente UNIQUE (numero_cliente, id_direccion),
    CONSTRAINT fk_direccion_cliente
        FOREIGN KEY (numero_cliente) REFERENCES cliente (numero_cliente)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS articulo (
    numero_articulo INT UNSIGNED NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    CONSTRAINT pk_articulo PRIMARY KEY (numero_articulo)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS fabrica (
    numero_fabrica INT UNSIGNED NOT NULL,
    telefono_contacto VARCHAR(30) NOT NULL,
    CONSTRAINT pk_fabrica PRIMARY KEY (numero_fabrica)
) ENGINE=InnoDB;

-- Stock is stored for each factory/article pair.
CREATE TABLE IF NOT EXISTS fabrica_articulo (
    numero_fabrica INT UNSIGNED NOT NULL,
    numero_articulo INT UNSIGNED NOT NULL,
    existencias INT UNSIGNED NOT NULL DEFAULT 0,
    CONSTRAINT pk_fabrica_articulo PRIMARY KEY (numero_fabrica, numero_articulo),
    CONSTRAINT fk_fabrica_articulo_fabrica
        FOREIGN KEY (numero_fabrica) REFERENCES fabrica (numero_fabrica),
    CONSTRAINT fk_fabrica_articulo_articulo
        FOREIGN KEY (numero_articulo) REFERENCES articulo (numero_articulo)
) ENGINE=InnoDB;

-- Optional strategic information about alternative factories.
CREATE TABLE IF NOT EXISTS fabrica_alternativa (
    numero_fabrica INT UNSIGNED NOT NULL,
    numero_fabrica_alternativa INT UNSIGNED NOT NULL,
    CONSTRAINT pk_fabrica_alternativa
        PRIMARY KEY (numero_fabrica, numero_fabrica_alternativa),
    CONSTRAINT chk_fabrica_no_es_su_propia_alternativa
        CHECK (numero_fabrica <> numero_fabrica_alternativa),
    CONSTRAINT fk_fabrica_alternativa_origen
        FOREIGN KEY (numero_fabrica) REFERENCES fabrica (numero_fabrica),
    CONSTRAINT fk_fabrica_alternativa_destino
        FOREIGN KEY (numero_fabrica_alternativa) REFERENCES fabrica (numero_fabrica)
) ENGINE=InnoDB;

-- Order header: customer, selected shipping address, and date including time.
CREATE TABLE IF NOT EXISTS pedido (
    numero_pedido INT UNSIGNED NOT NULL,
    numero_cliente INT UNSIGNED NOT NULL,
    id_direccion INT UNSIGNED NOT NULL,
    fecha_pedido DATETIME NOT NULL,
    CONSTRAINT pk_pedido PRIMARY KEY (numero_pedido),
    CONSTRAINT fk_pedido_direccion_del_cliente
        FOREIGN KEY (numero_cliente, id_direccion)
        REFERENCES direccion_envio (numero_cliente, id_direccion)
) ENGINE=InnoDB;

-- Order body: one row per article in an order.
CREATE TABLE IF NOT EXISTS detalle_pedido (
    numero_pedido INT UNSIGNED NOT NULL,
    numero_articulo INT UNSIGNED NOT NULL,
    cantidad INT UNSIGNED NOT NULL,
    CONSTRAINT pk_detalle_pedido PRIMARY KEY (numero_pedido, numero_articulo),
    CONSTRAINT chk_detalle_pedido_cantidad CHECK (cantidad > 0),
    CONSTRAINT fk_detalle_pedido_pedido
        FOREIGN KEY (numero_pedido) REFERENCES pedido (numero_pedido),
    CONSTRAINT fk_detalle_pedido_articulo
        FOREIGN KEY (numero_articulo) REFERENCES articulo (numero_articulo)
) ENGINE=InnoDB;

-- Number of articles supplied by a factory can be queried from FABRICA_ARTICULO;
-- it is not stored as a duplicate derived value.
-- No sample data is inserted.
