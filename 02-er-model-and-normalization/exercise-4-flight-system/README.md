# Exercise 4 — Flight System (Sistema de Vuelos)

This exercise describes an Entity–Relationship model, minimum/maximum cardinalities, a relational schema, a relationship matrix, and integrity constraints for a flight system.

## Main entities and tables

- `AEROPUERTO`: airport code, name, city, and country.
- `MODELO_AVION`: aircraft model and capacity.
- `PROGRAMA_VUELO`: globally unique flight number, airline, operating weekdays, origin airport, and destination airport.
- `VUELO`: a specific flight instance with its own identifier, scheduled program, aircraft model, date, and empty seats.
- `ESCALA`: a stop belonging to a specific flight and airport, with order number and passenger boarding/alighting counts.

## Relationships and cardinalities

- `PUEDE_RECIBIR`: airports and aircraft models have an N:M relationship.
- `DESPEGA_DE`: each flight program has exactly one origin airport; an airport may be the origin for zero or many programs.
- `ATERRIZA_EN`: each flight program has exactly one destination airport; an airport may be the destination for zero or many programs.
- `REALIZA`: a program may generate zero or many concrete flights; each concrete flight belongs to exactly one program.
- `UTILIZA`: each concrete flight uses exactly one aircraft model; a model may be used by zero or many flights.
- `TIENE`: a flight may have zero or many stops; each stop belongs to exactly one flight.
- `OCURRE_EN`: each stop occurs at exactly one airport; an airport may host zero or many stops.

## Relational schema and keys

- `AEROPUERTO`: `codigo` (PK), name, city, country.
- `MODELO_AVION`: `modelo` (PK), capacity.
- `PROGRAMA_VUELO`: `numero_vuelo` (PK), airline, weekdays, `codigo_origen` (FK), `codigo_destino` (FK).
- `VUELO`: `id_vuelo` (PK), `numero_vuelo` (FK), `modelo` (FK), date, empty seats.
- `ESCALA`: composite PK `(id_vuelo, numero_orden)`; also references a flight and an airport.
- `PUEDE_RECIBIR`: associative table with composite PK `(codigo_aeropuerto, modelo)`.

## Important constraints from the exercise

- Each flight program references one origin and one destination airport.
- Each concrete flight is associated with exactly one program and one aircraft model.
- Empty seats cannot be negative or exceed the capacity of the aircraft model used.
- The stop order number can repeat across different flights but not within the same flight.
- Each stop references an existing flight and airport.
- `PUEDE_RECIBIR` is a relationship in the E/R model and becomes an associative table in the relational model.
- The exercise notes that the minimum cardinalities for airports depend on the exact wording of the original assignment.

## Files

The original diagram and complete exercise document have not yet been copied into this repository. This README is an English study note based on the provided exercise document.
