# Exercise 2 — Sales System (Sistema de ventas)

This note follows the official three-page assignment, **Ejercicios Modelo Entidad/Relación**, Exercise 2. The task is to model a sales system that manages suppliers, customers, products, and sales invoices.

## Requirements from the official statement

- A supplier has CIF/NIF, name, address, telephone, and website.
- A customer has CIF/NIF, name, address, and may have multiple contact telephone numbers.
- An address consists of street, number, city, and postal code.
- A product has a unique ID, name, current price, stock, and one supplier.
- Products are grouped into categories; each product belongs to exactly one category.
- A category has an ID, name, and description.
- An invoice records its number, date, customer, discount, and final amount including VAT.
- For each product sold, the system records the sale-time price, quantity sold, and total amount for that product line.

## SQL implementation

- [MySQL schema script](schema.sql)

The script defines supplier and customer CIF/NIF identifiers, a separate table for a customer's multiple telephone numbers, categories, products, invoices, and invoice detail lines.

## Relational design

| Table | Purpose |
|---|---|
| `proveedor` | Supplier CIF/NIF, name, address, telephone, website |
| `cliente` | Customer CIF/NIF, name, address |
| `cliente_telefono` | Multiple contact telephone numbers per customer |
| `categoria` | Category ID, name, description |
| `producto` | Product details plus supplier and category foreign keys |
| `factura` | Invoice number/date, customer, discount, final amount including VAT |
| `detalle_factura` | Products on each invoice, sale-time price, quantity, line total |

The official statement does **not** specify a direct N:M relationship between invoices and suppliers, so the current SQL schema does not add an extra `factura_proveedor` table. A product references one supplier and one category, as required by the prompt.

## Implementation notes

The official statement does not dictate SQL data types or exact identifier names. Those are implementation choices in `schema.sql`. The script has been aligned to the written statement, but has not yet been executed against a MySQL server.

The original assignment PDF and diagram are not yet stored as binary files in this GitHub repository.
