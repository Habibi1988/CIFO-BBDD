# Exercise 1 — Articles and Orders (Artículos y encargos)

This note follows the official three-page assignment, **Ejercicios Modelo Entidad/Relación**, Exercise 1. The statement asks for an E/R model covering customers, articles, orders, and factories.

## Requirements from the official statement

- Each customer has a unique customer number, multiple shipping addresses, balance, credit limit, and discount.
- A customer's credit limit must not exceed **€3,000,000**.
- Each article has a unique article number, description, and relationships to the factories distributing it.
- Stock must be recorded for each article at each factory.
- Each order has a header with the customer, selected shipping address, and order date including time.
- The order body contains multiple lines, each identifying an article and quantity.
- Factory information includes a unique factory number and contact telephone.
- The total number of articles supplied by a factory should be obtainable.
- The statement also proposes optionally storing alternative factories for strategic purposes.
- An address consists of street, number, city, and postal code.

## SQL implementation

- [MySQL schema script](schema.sql)

The script includes primary and foreign keys, a check constraint for the €3,000,000 credit limit, stock by factory/article pair, order header/detail tables, and an optional self-referencing alternative-factory relationship.

## Relational design choices

| Table | Purpose |
|---|---|
| `cliente` | Customer number, balance, credit limit, discount |
| `direccion_envio` | Multiple shipping addresses associated with a customer |
| `articulo` | Unique article number and description |
| `fabrica` | Factory number and contact telephone |
| `fabrica_articulo` | N:M factory/article relationship plus stock per pair |
| `fabrica_alternativa` | Optional factory-to-factory alternative relationship |
| `pedido` | Order header with customer, address, and date/time |
| `detalle_pedido` | Order lines with article and quantity |

The total number of article types supplied by a factory can be calculated from `fabrica_articulo`; it is not stored redundantly.

## Implementation notes

The official statement specifies business requirements but does not dictate SQL data types or exact identifier names. Those are implementation choices in `schema.sql`. The script has been aligned to the written statement, but has not yet been executed against a MySQL server.

The original assignment PDF and diagram are not yet stored as binary files in this GitHub repository.
