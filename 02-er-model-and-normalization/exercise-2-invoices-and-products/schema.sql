-- Exercise 2 — Customers, invoices, suppliers, products, and categories
-- MySQL 8.4
-- Source basis: the supplied "Ejercicio 2 — Modelo relacional" material.
-- The source defines attributes, PKs/FKs and relationships, but not SQL data types.
-- Data types below are implementation choices and can be adjusted to the instructor's requirements.

CREATE DATABASE IF NOT EXISTS cifo_exercise_2;
USE cifo_exercise_2;

CREATE TABLE IF NOT EXISTS cliente (
    id_cliente INT UNSIGNED NOT NULL,
    nombre VARCHAR(120) NOT NULL,
    calle VARCHAR(150) NULL,
    numero VARCHAR(20) NULL,
    ciudad VARCHAR(100) NULL,
    codigo_postal VARCHAR(15) NULL,
    CONSTRAINT pk_cliente PRIMARY KEY (id_cliente)
) ENGINE=InnoDB;

-- A customer can have multiple telephone numbers.
CREATE TABLE IF NOT EXISTS cliente_telefono (
    id_cliente INT UNSIGNED NOT NULL,
    telefono VARCHAR(30) NOT NULL,
    CONSTRAINT pk_cliente_telefono PRIMARY KEY (id_cliente, telefono),
    CONSTRAINT fk_cliente_telefono_cliente
        FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS factura (
    id_factura INT UNSIGNED NOT NULL,
    id_cliente INT UNSIGNED NOT NULL,
    direccion VARCHAR(200) NULL,
    descuento DECIMAL(5,2) NULL,
    importe DECIMAL(12,2) NULL,
    iva DECIMAL(5,2) NULL,
    CONSTRAINT pk_factura PRIMARY KEY (id_factura),
    CONSTRAINT fk_factura_cliente
        FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS proveedor (
    id_proveedor INT UNSIGNED NOT NULL,
    nombre VARCHAR(120) NOT NULL,
    calle VARCHAR(150) NULL,
    numero VARCHAR(20) NULL,
    ciudad VARCHAR(100) NULL,
    codigo_postal VARCHAR(15) NULL,
    telefono VARCHAR(30) NULL,
    pagina_web VARCHAR(255) NULL,
    CONSTRAINT pk_proveedor PRIMARY KEY (id_proveedor)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS categoria (
    id_categoria INT UNSIGNED NOT NULL,
    nombre VARCHAR(120) NOT NULL,
    descripcion VARCHAR(255) NULL,
    CONSTRAINT pk_categoria PRIMARY KEY (id_categoria)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS producto (
    id_producto INT UNSIGNED NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    precio_actual DECIMAL(12,2) NOT NULL,
    stock INT UNSIGNED NOT NULL DEFAULT 0,
    id_proveedor INT UNSIGNED NOT NULL,
    id_categoria INT UNSIGNED NOT NULL,
    CONSTRAINT pk_producto PRIMARY KEY (id_producto),
    CONSTRAINT fk_producto_proveedor
        FOREIGN KEY (id_proveedor) REFERENCES proveedor (id_proveedor),
    CONSTRAINT fk_producto_categoria
        FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
) ENGINE=InnoDB;

-- Resolves the N:M relationship between invoices and products.
CREATE TABLE IF NOT EXISTS detalle_factura (
    id_factura INT UNSIGNED NOT NULL,
    id_producto INT UNSIGNED NOT NULL,
    cantidad INT UNSIGNED NOT NULL,
    precio DECIMAL(12,2) NOT NULL,
    importe_total DECIMAL(12,2) NULL,
    CONSTRAINT pk_detalle_factura PRIMARY KEY (id_factura, id_producto),
    CONSTRAINT fk_detalle_factura_factura
        FOREIGN KEY (id_factura) REFERENCES factura (id_factura),
    CONSTRAINT fk_detalle_factura_producto
        FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
) ENGINE=InnoDB;

-- Preserves the N:M FACTURA–PROVEEDOR relationship shown in the supplied model.
CREATE TABLE IF NOT EXISTS factura_proveedor (
    id_factura INT UNSIGNED NOT NULL,
    id_proveedor INT UNSIGNED NOT NULL,
    CONSTRAINT pk_factura_proveedor PRIMARY KEY (id_factura, id_proveedor),
    CONSTRAINT fk_factura_proveedor_factura
        FOREIGN KEY (id_factura) REFERENCES factura (id_factura),
    CONSTRAINT fk_factura_proveedor_proveedor
        FOREIGN KEY (id_proveedor) REFERENCES proveedor (id_proveedor)
) ENGINE=InnoDB;

-- Review before implementation:
-- The source diagram and relational notes contain some differences in labels and
-- relationship readability. This script follows the relational schema summarized
-- in the exercise notes, including FACTURA_PROVEEDOR as an associative table.
-- importe_total is retained because it appears in the source schema; it could be
-- calculated from cantidad * precio in a later design revision.
-- No sample data is inserted; the script only creates the schema.
