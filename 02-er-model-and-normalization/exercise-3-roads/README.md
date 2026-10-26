# Exercise 3 — Roads (Carreteras)

This exercise documents an Entity–Relationship model, relational schema, cardinalities, relationship attributes, and business constraints for a road network.

## Main entities and tables

- `COMUNIDAD_AUTONOMA`: autonomous community identifier and name.
- `PROVINCIA`: province identifier and name; references its autonomous community.
- `CARRETERA`: road details such as name, ownership, level, road type, controlled access, dual carriageway, prefix, color, signal, and observations.
- `TRAMO`: a road segment; references a road and stores initial/final kilometres, terrain, environment, speed limit, lanes per direction, and observations.
- `PASA_POR`: associative table connecting a segment with provinces, with passage order and start/end kilometres.
- `EXTREMO`: an endpoint of a segment, including position, type, and kilometre.
- `CONFLUYE_CON`: optional connection from an endpoint to a destination segment and province, including the confluence kilometre.

## Relationships and cardinalities

- An autonomous community has one or more provinces; each province belongs to one autonomous community.
- A road has one or more segments; each segment belongs to one road.
- A segment passes through one or more provinces; a province may contain zero or more segments.
- A segment may have zero, one, or two endpoints; each endpoint belongs to one segment.
- An endpoint may have zero or one connection. The destination segment and destination province can each be referenced by multiple connections.

## Important constraints from the exercise

- The final kilometre must be greater than the initial kilometre.
- Segment length is derived as `km_final - km_inicial`.
- Each road must have exactly one initial endpoint and one final endpoint.
- If an endpoint is of type `concluye`, no confluence is recorded. If it is of type `confluye`, the destination segment, destination province, and confluence kilometre are required.
- The kilometre ranges recorded in `PASA_POR` must be consistent with the segment's initial and final kilometres.
- The exercise defines `PASA_POR` with composite primary key `(id_tramo, orden)`, and `CONFLUYE_CON` with `id_extremo` as its primary key.

## Files

The original diagram and full exercise document have not yet been copied into this repository. This README is an English study note based on the provided exercise document.
