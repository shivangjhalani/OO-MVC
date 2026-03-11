# Student Management System — Consolidated Documentation

# Table of contents

1. [Lab Rubrics (MVC)](#lab-rubrics-mvc)
2. [Problem Statement — Student Management System](#problem-statement---student-management-system)
   - [Home Page (Main Screen) Requirements](#home-page-main-screen)
   - [Implementation Details](#implementation-details)
     - [Model](#model)
     - [View (UI)](#view-ui)
     - [Controller](#controller)
     - [Service Layer Responsibilities](#service-layer-responsibilities)

   - [Expected Functional Behavior](#expected-functional-behavior)

3. [Reference Guide (Quick) — Spring Boot, Hibernate (JPA), MySQL](#reference-guide-quick)

---

# Lab Rubrics (MVC)

**Rubric table (criteria & marks)**

| Criteria                               |                                                                                                                                      Description | Marks |
| -------------------------------------- | -----------------------------------------------------------------------------------------------------------------------------------------------: | ----: |
| **1. MVC Architecture Implementation** |                                                                                             Proper separation of Model, View, Controller layers. |     2 |
| **2. Model & JPA Mapping**             | Entity correctly implemented with fields `id`, `name`, `email`, `course`. Proper use of `@Entity`, `@Id`, `@GeneratedValue` and JPA annotations. |     2 |
| **3. Controller & REST Endpoints**     |   Correct implementation of endpoints: `POST /api/students` and `GET /api/students`. Requests handled properly and responses returned correctly. |     2 |
| **4. Service Layer & Business Logic**  |                                                     Service layer implemented correctly; interaction with repository; business logic separation. |     1 |
| **5. View Implementation (UI)**        |                                                               Web pages implemented correctly. Form submission works and displays database data. |     2 |
| **6. Database Integration**            |                                          Data stored and retrieved from MySQL/H2 using Hibernate/JPA. Auto-generated ID works and data persists. |     1 |

_Institution:_ PES University, Department of Computer Science and Engineering

---

# Problem Statement — Student Management System

## Overview

Build a web-based **Student Management System** that performs basic CRUD using:

- **Spring Boot** (MVC Architecture)
- **Hibernate (JPA)**
- **Relational Database** (MySQL / H2)

---

## Home Page (Main Screen) Requirements

When the application runs ([http://localhost:8080/](http://localhost:8080/)), the browser should display a **Student Registration Form** and a **Student List Table**.

**Student Registration Form — fields**

- Name (text) — required
- Email (text) — required
- Course (text or dropdown) — required
- Submit button

**Form behavior**

- On submit:
  - Data must be stored in the database.
  - Page must refresh.
  - Newly added student must appear in the list below.

**Student List Table — columns**

- ID | Name | Email | Course

**Table behavior**

- Data must be fetched from the database.
- Table must update after each insert.
- ID must be auto-generated.

---

## Implementation Details

### Model

Create a `Student` entity with attributes:

- `id` — auto-generated unique identifier
- `name`
- `email`
- `course`

**CRUD operations required**

- **Create:** Add a new student on form submission.
- **Read:**
  - Retrieve student by ID
  - Retrieve all students
  - Retrieve students by course

JPA annotations expected (`@Entity`, `@Id`, `@GeneratedValue`, etc.).

### View (UI)

Provide a web page that allows users to:

- Submit a new student registration form (all fields required).
- View all student records in a list/table format below the form.

Form submission should persist data and refresh the page showing the updated table.

### Controller

`StudentController` responsibilities:

- Handle HTTP requests related to students.
- Act as intermediary between View and Model by interacting with `StudentService`.
- **RESTful endpoints required:**
  - `POST /api/students` — create a new student from user input.
  - `GET /api/students` — fetch list of all students.

Controller must:

- Validate incoming requests.
- Ensure required fields are present.
- Interact with the service layer for business logic.
- Persist data using JPA/Hibernate.

### Service Layer Responsibilities

`StudentService` should:

- Contain business logic.
- Prevent duplicate email registration.
- Coordinate with repository (i.e., `StudentRepository`).

---

## Expected Functional Behavior

- Student can be added.
- Student list can be viewed.
- Duplicate student details (email) not allowed.
- Data persists in the database.
- MVC structure is properly followed.

---

# Reference Guide (Quick) — Spring Boot, Hibernate (JPA), MySQL

## 1. Spring Boot (MVC Architecture) — key concepts

- Spring Boot: Java framework for rapid, production-ready web apps; follows MVC.
- Key concepts to use:
  - MVC Architecture
  - REST Controllers (`@RestController` / `@Controller`)
  - Dependency Injection (`@Autowired`, constructor injection)
  - Auto-configuration (starter dependencies)
  - Embedded server (Tomcat by default)

**Suggested documentation / tutorials (from guide):**

- Spring Boot project page: `https://spring.io/projects/spring-boot`
- Official reference: `https://docs.spring.io/spring-boot/docs/current/reference/html/`
- MVC tutorials: Baeldung, GeeksforGeeks (links included in original guide).

## 2. Hibernate (JPA) — key concepts

- Hibernate: ORM implementing JPA — maps Java objects to DB tables.
- Concepts to apply:
  - Entity classes (`@Entity`)
  - Primary key annotations (`@Id`, `@GeneratedValue`)
  - Relationships (One-to-One, One-to-Many) if needed
  - JPQL queries
  - Fetch types (EAGER / LAZY)

**Official / tutorial links included in guide:**

- `https://hibernate.org/orm/`
- JPA spec and tutorials referenced (Baeldung / GeeksforGeeks).

## 3. Relational Databases (MySQL)

- Use MySQL (or H2 for in-memory) as relational DB.
- Guide references official MySQL documentation (`https://dev.mysql.com/doc/`).
