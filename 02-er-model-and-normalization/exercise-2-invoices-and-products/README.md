# Exercise 2 — Invoices, Customers, Suppliers, and Products

This study note summarizes the supplied *Ejercicio 2 — Modelo relacional* document. The exercise transforms an E/R model for customer invoices, suppliers, products, and categories into relational tables.

## SQL implementation

- [MySQL schema script](schema.sql) — creates the tables, primary keys, and foreign keys described below. Data types are implementation choices because the source exercise does not specify them.

## Relational schema

| Table | Columns and keys |
|---|---|
| `CLIENTE` | `id_cliente` (PK), `nombre`, `calle`, `numero`, `ciudad`, `codigo_postal` |
| `CLIENTE_TELEFONO` | `id_cliente` (PK, FK), `telefono` (PK) |
| `FACTURA` | `id_factura` (PK), `id_cliente` (FK), `direccion`, `descuento`, `importe`, `iva` |
| `PROVEEDOR` | `id_proveedor` (PK), `nombre`, `calle`, `numero`, `ciudad`, `codigo_postal`, `telefono`, `pagina_web` |
| `CATEGORIA` | `id_categoria` (PK), `nombre`, `descripcion` |
| `PRODUCTO` | `id_producto` (PK), `nombre`, `precio_actual`, `stock`, `id_proveedor` (FK), `id_categoria` (FK) |
| `DETALLE_FACTURA` | `id_factura` (PK, FK), `id_producto` (PK, FK), `cantidad`, `precio`, `importe_total` |
| `FACTURA_PROVEEDOR` | `id_factura` (PK, FK), `id_proveedor` (PK, FK) |

## Relationships and transformations

- **Customer–Telephone:** a multivalued telephone attribute is represented by `CLIENTE_TELEFONO`, with composite primary key `(id_cliente, telefono)`.
- **Customer–Invoice (1:N):** `id_cliente` is stored as a foreign key in `FACTURA`.
- **Invoice–Supplier (N:M):** represented by `FACTURA_PROVEEDOR` according to the supplied relational-model document.
- **Supplier–Product (1:N):** `id_proveedor` is stored as a foreign key in `PRODUCTO`.
- **Invoice–Product (N:M):** represented by `DETALLE_FACTURA`, which stores quantity, price, and total line amount.
- **Product–Category (N:1):** `id_categoria` is stored as a foreign key in `PRODUCTO`.

## Notes

The supplied document retains `importe_total` as a line attribute even though it could be calculated from quantity and price in a real implementation. The relationship between invoice and supplier is represented as an associative table because the source model indicates an N:M relationship.

The exercise diagram and the relational schema document use some different labels. Review the instructor's expected naming and cardinalities before treating this as a final database implementation.

## Original files

The supplied source files are available in the current ChatGPT conversation but have not yet been uploaded as binary files to this GitHub repository.
