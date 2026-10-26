# CIFO-BBDD | Relational Databases & SQL

A learning portfolio documenting my 200-hour database and SQL programming course at **CIFO La Violeta, Barcelona, Spain**. This repository brings together database design exercises, SQL practice, course assignments, and practical projects as I progress through the curriculum.

> **Status:** In progress  
> **Primary language:** SQL  
> **Database platform:** MySQL  
> **Tools:** MySQL Workbench, Visual Studio Code

## Course overview

The course is organized into five training units (UF), totaling 200 hours.

| Unit | Topic | Hours | Main learning goals |
|---|---|---:|---|
| UF01 | Introduction and Design of Relational Databases | 30 | Analyze information requirements and design databases conceptually. |
| UF02 | Entity–Relationship Model and Normalization | 30 | Build ER models, map them to relational models, define integrity constraints, and normalize data up to Third Normal Form (3NF). |
| UF03 | Data Definition Language (DDL) | 40 | Create and modify database structures and define schema objects. |
| UF04 | Data Manipulation Language (DML) | 50 | Query and manipulate data, work with multiple tables, and use aggregation. |
| UF05 | Database Programming | 50 | Work with database objects such as triggers and stored procedures, and study query performance. |
| **Total** | | **200** | |

## Repository structure

- [01 — Relational Database Design](01-relational-database-design/README.md)
- [02 — ER Model and Normalization](02-er-model-and-normalization/README.md)
- [03 — Data Definition Language (DDL)](03-ddl/README.md)
- [04 — Data Manipulation Language (DML) and Queries](04-dml-and-queries/README.md)
- [05 — Database Programming](05-database-programming/README.md)
- [Supporting documentation](docs/README.md)

## ER and relational-model exercises

The following English study notes document the models, relationships, keys, cardinalities, and constraints from the provided coursework:

- [Exercise 1 — Orders and Delivery Addresses](02-er-model-and-normalization/exercise-1-orders-and-delivery/README.md) — [SQL schema](02-er-model-and-normalization/exercise-1-orders-and-delivery/schema.sql)
- [Exercise 2 — Invoices and Products](02-er-model-and-normalization/exercise-2-invoices-and-products/README.md) — [SQL schema](02-er-model-and-normalization/exercise-2-invoices-and-products/schema.sql)
- [Exercise 3 — Roads (Carreteras)](02-er-model-and-normalization/exercise-3-roads/README.md)
- [Exercise 4 — Flight System (Sistema de Vuelos)](02-er-model-and-normalization/exercise-4-flight-system/README.md)
- [ER model and normalization section](02-er-model-and-normalization/README.md)

**Official assignment source:** The three-page PDF `Ejercicios Modelo Entidad/Relación` has been provided in this conversation and is the reference for Exercises 1–4. It has not yet been uploaded as a binary file to this repository. The exercise pages are English study notes, not replacements for the official assignment or original diagrams. Before transferring files, retain one copy of duplicate diagram PDFs and keep the distinct relational-model documents.

## Existing material

- [Existing course assignment PDF](articulos-encargos/ejercicio%201.pdf)

## Learning roadmap

- [ ] Relational database concepts and conceptual design
- [ ] Entity–Relationship diagrams and relational mapping
- [ ] Keys, relationships, and integrity constraints
- [ ] Database normalization through 3NF
- [ ] DDL: creating and altering database objects
- [ ] DML: querying and modifying data
- [ ] Joins, subqueries, and aggregate functions
- [ ] Stored procedures and triggers
- [ ] Query performance and optimization
- [ ] Practical database exercises and course project

## Tools and setup

The course materials reference **MySQL 8.4 LTS**, **MySQL Workbench**, and **Visual Studio Code**.

- [MySQL Community Server](https://dev.mysql.com/downloads/mysql/)
- [MySQL Workbench](https://dev.mysql.com/downloads/workbench/)
- [Visual Studio Code](https://code.visualstudio.com/)

Follow the instructor's current course guidance for exact installation steps and version requirements.

## How to use this repository

1. Browse the course topics and exercise folders.
2. Open SQL scripts in MySQL Workbench or another compatible SQL editor.
3. Read the comments and accompanying documentation before running scripts.
4. Use a test database for practice, especially for statements that modify or delete data.

## Portfolio purpose

This repository is both a record of my learning and a practical portfolio artifact. It is intended to demonstrate database design, SQL querying, data integrity, and database programming skills relevant to data analysis and business intelligence roles.

Exercises and projects will be documented as they are completed. Course assignments are learning materials; any future portfolio projects will clearly describe their scope, schema, queries, and findings.

---

*Maintained as part of my database and SQL learning journey at CIFO La Violeta, Barcelona.*
