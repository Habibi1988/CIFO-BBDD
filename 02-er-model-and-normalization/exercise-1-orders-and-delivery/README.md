# Exercise 1 — Orders, Articles, Factories, and Delivery Addresses

This study note summarizes the supplied *Modelo relacional ejercicio 1* document. The source diagram models customers, delivery addresses, orders, factories, articles, and order details.

## Relational schema

| Table | Columns and keys |
|---|---|
| `CLIENTE` | `id_cliente` (PK), `saldo`, `credito`, `dcto` |
| `DIRECCION_ENVIO` | `id_direccion` (PK), `calle`, `ciudad`, `codigo_postal`, `dcto` |
| `CLIENTE_DIRECCION` | `id_cliente` (PK, FK), `id_direccion` (PK, FK) |
| `PEDIDO` | `id_pedido` (PK), `hora`, `fecha`, `id_cliente` (FK), `id_direccion` (FK) |
| `FABRICA` | `num` (PK), `telefono`, `tipo_fabrica` |
| `ARTICULO` | `id_articulo` (PK), `descripcion_articulo` |
| `FABRICA_ARTICULO` | `num_fabrica` (PK, FK), `id_articulo` (PK, FK) |
| `DETALLE_PEDIDO` | `id_pedido` (PK, FK), `id_articulo` (PK, FK), `cantidad` |

## Relationships

- **Customer–Order (1:N):** `id_cliente` is a foreign key in `PEDIDO`.
- **Customer–Delivery Address (N:M):** represented by `CLIENTE_DIRECCION` with a composite primary key.
- **Order–Delivery Address (N:1):** the selected delivery address is referenced from `PEDIDO`.
- **Order–Order Detail (1:N):** `DETALLE_PEDIDO` references `PEDIDO`.
- **Order Detail–Article:** the line identifies an article and stores the ordered quantity.
- **Factory–Article (N:M):** represented by `FABRICA_ARTICULO`.

## Notes

Names have been normalized to use SQL-friendly identifiers without spaces or accents. If the instructor requires the original Spanish names or specific cardinalities exactly as drawn, follow the submitted course specification.

## Original files

The supplied source files are available in the current ChatGPT conversation but have not yet been uploaded as binary files to this GitHub repository.
