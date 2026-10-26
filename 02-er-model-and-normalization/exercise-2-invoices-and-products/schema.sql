-- Exercise 2 — Sistema de ventas (Sales System)
-- MySQL 8.4
-- Based on the official exercise statement (Ejercicios Modelo Entidad/Relación).
-- Data types and identifiers are implementation choices where the prompt is silent.

CREATE DATABASE IF NOT EXISTS cifo_exercise_2;
USE cifo_exercise_2;

CREATE TABLE IF NOT EXISTS proveedor (
    cif_nif VARCHAR(20) NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    calle VARCHAR(150) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    codigo_postal VARCHAR(15) NOT NULL,
    telefono VARCHAR(30) NOT NULL,
    pagina_web VARCHAR(255) NULL,
    CONSTRAINT pk_proveedor PRIMARY KEY (cif_nif)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS cliente (
    cif_nif VARCHAR(20) NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    calle VARCHAR(150) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    codigo_postal VARCHAR(15) NOT NULL,
    CONSTRAINT pk_cliente PRIMARY KEY (cif_nif)
) ENGINE=InnoDB;

-- A client may have several contact telephone numbers.
CREATE TABLE IF NOT EXISTS cliente_telefono (
    cif_nif_cliente VARCHAR(20) NOT NULL,
    telefono VARCHAR(30) NOT NULL,
    CONSTRAINT pk_cliente_telefono PRIMARY KEY (cif_nif_cliente, telefono),
    CONSTRAINT fk_cliente_telefono_cliente
        FOREIGN KEY (cif_nif_cliente) REFERENCES cliente (cif_nif)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS categoria (
    id_categoria INT UNSIGNED NOT NULL,
    nombre VARCHAR(120) NOT NULL,
    descripcion VARCHAR(255) NULL,
    CONSTRAINT pk_categoria PRIMARY KEY (id_categoria)
) ENGINE=InnoDB;

-- Each product has exactly one supplier and belongs to one category.
CREATE TABLE IF NOT EXISTS producto (
    id_producto INT UNSIGNED NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    precio_actual DECIMAL(12,2) NOT NULL,
    stock INT UNSIGNED NOT NULL DEFAULT 0,
    cif_nif_proveedor VARCHAR(20) NOT NULL,
    id_categoria INT UNSIGNED NOT NULL,
    CONSTRAINT pk_producto PRIMARY KEY (id_producto),
    CONSTRAINT chk_producto_precio CHECK (precio_actual >= 0),
    CONSTRAINT fk_producto_proveedor
        FOREIGN KEY (cif_nif_proveedor) REFERENCES proveedor (cif_nif),
    CONSTRAINT fk_producto_categoria
        FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS factura (
    numero_factura INT UNSIGNED NOT NULL,
    fecha DATETIME NOT NULL,
    cif_nif_cliente VARCHAR(20) NOT NULL,
    descuento DECIMAL(5,2) NOT NULL DEFAULT 0,
    importe_final_con_iva DECIMAL(14,2) NOT NULL,
    CONSTRAINT pk_factura PRIMARY KEY (numero_factura),
    CONSTRAINT chk_factura_descuento CHECK (descuento >= 0 AND descuento <= 100),
    CONSTRAINT chk_factura_importe CHECK (importe_final_con_iva >= 0),
    CONSTRAINT fk_factura_cliente
        FOREIGN KEY (cif_nif_cliente) REFERENCES cliente (cif_nif)
) ENGINE=InnoDB;

-- Store the price at the moment of sale, quantity, and product line total.
CREATE TABLE IF NOT EXISTS detalle_factura (
    numero_factura INT UNSIGNED NOT NULL,
    id_producto INT UNSIGNED NOT NULL,
    precio_venta DECIMAL(12,2) NOT NULL,
    cantidad INT UNSIGNED NOT NULL,
    importe_total_producto DECIMAL(14,2) NOT NULL,
    CONSTRAINT pk_detalle_factura PRIMARY KEY (numero_factura, id_producto),
    CONSTRAINT chk_detalle_factura_precio CHECK (precio_venta >= 0),
    CONSTRAINT chk_detalle_factura_cantidad CHECK (cantidad > 0),
    CONSTRAINT chk_detalle_factura_importe CHECK (importe_total_producto >= 0),
    CONSTRAINT fk_detalle_factura_factura
        FOREIGN KEY (numero_factura) REFERENCES factura (numero_factura),
    CONSTRAINT fk_detalle_factura_producto
        FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
) ENGINE=InnoDB;

-- The official prompt does not specify an invoice-to-supplier relationship.
-- No such extra relation is introduced here.
-- No sample data is inserted.
