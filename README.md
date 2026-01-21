******************************************************
Task 1 – Database Modeling Project (Optics & Pizzeria)
******************************************************


📘 Description

Learning project focused on designing relational database models for two real‑world business scenarios: an optical store and a food‑delivery pizzeria.The goal is to practice conceptual modeling, logical modeling, and physical implementation using SQL, ensuring data integrity, normalization, and correct relationship handling.

Both exercises reinforce essential database‑design skills such as entity identification, relationship mapping, cardinality definition, and foreign‑key usage.

📌 Exercise Statement

👓 Exercise 1: Optics Management System

The optical store “Cul d’Ampolla” wants to digitalize the management of clients and glasses sales.

The system must store:

Suppliers

Name

Full address (street, number, floor, door, city, postal code, country)

Phone

Fax

Tax ID (NIF)

Business rule:A brand of glasses is supplied by one single supplier, but a supplier may provide multiple brands.

Glasses

Brand

Lens graduation (left and right)

Frame type (floating, plastic, metal)

Frame color

Lens color (left and right)

Price

Clients

Name

Postal address

Phone

Email

Registration date

Referred‑by client (optional, self‑reference)

Employees

The system must record which employee sold each pair of glasses.

🧾 Table sale (missing in original README)

The sale table registers each glasses sale and links the involved entities.

Attributes:

sale_id (PK)

sale_date

client_id (FK → client)

employee_id (FK → employee)

glasses_id (FK → glasses)

Purpose:

Tracks who bought what, when, and which employee handled the sale.

Resolves the 1:N relationship between client → sales and employee → sales.

Ensures traceability of each glasses transaction.

🍕 Exercise 2: Pizzeria Delivery System

A company wants to build a web platform for online food delivery orders.

The system must store:

Clients

Unique identifier

Name

Surname

Address

Postal code

Locality

Province

Phone number

Rules:

A locality belongs to one province

A province has many localities

Orders

Unique identifier

Date/time

Delivery type (home delivery or in‑store pickup)

Quantity of each product type

Total price

Relationships:

One client can make many orders

Each order belongs to one client

An order may contain one or multiple products

Products

Products include pizzas, hamburgers, and drinks.

Attributes:

Name

Description

Image

Price

Pizza Categories

Unique identifier

Name

Rule:A pizza belongs to one category, but a category may contain many pizzas.

Stores

Unique identifier

Address

Postal code

Locality

Province

Rule:A store manages many orders.

Employees

Unique identifier

Name

Surname

Tax ID (NIF)

Phone

Role (cook or delivery)

Rule:Each employee works in one store.

For delivery orders, the system must store:

The delivery employee

The delivery date/time

✨ Features

Full relational modeling for two business domains

Proper use of primary keys, foreign keys, and associative tables

Handling of 1:N and N:M relationships

Use of SQL ENUM for controlled values (delivery type, employee role)

Self‑referencing relationships (client referrals in the optics system)

Normalized structure ensuring data consistency

🛠 Technologies

MySQL 8+

MySQL Workbench

SQL DDL & DML

ERD diagrams (conceptual and logical models)

🚀 Installation and Execution

Before running any script, create and select the database:

CREATE DATABASE optics_pizzeria;
-- or
CREATE SCHEMA optics_pizzeria;

USE optics_pizzeria;

Then:

Execute the table‑creation scripts in MySQL Workbench

Insert sample data if needed

Run validation queries to ensure the model behaves correctly

Use ERD diagrams to visualize and justify design decisions

🧩 Diagrams and Technical Justification

ERD diagrams show entities, attributes, and relationships.

Justification includes:

Why certain tables exist

Why relationships are 1:N or N:M

Why associative tables are required

Why normalization avoids redundancy

Why ENUM is used for controlled values



