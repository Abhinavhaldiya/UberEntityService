# Uber Entity Service

The **Uber Entity Service** is a core microservice responsible for centralizing the domain models, database schemas, and database migrations for the Uber backend architecture. By isolating entities and migrations into a dedicated service, this ensures a single source of truth for the data layer across the distributed system.

---

## 🏗️ Core Entities

This service manages the schemas and relationships for the following primary domain entities:

* **Booking**: Represents a ride request, tracking its lifecycle (e.g., requested, accepted, in-progress, completed, canceled), timestamps, pricing, and references to the associated passenger and driver.
* **Driver**: Contains driver profile information, operational status (online/offline), current location coordinates, and ratings.
* **Car**: Manages vehicle details associated with drivers, including make, model, year, license plate, and capacity.
* **Passenger**: Stores rider profiles, payment methods, default locations, and overall rider metrics.
* **Review**: Handles the feedback and rating system for both drivers and passengers after a booking is completed.

---

## 🗄️ Database Migrations

This repository maintains all database versioning and schema changes. 

Migrations are structured to ensure reliable, reproducible database states across all environments (Local, Staging, Production). 

### Adding a New Migration
When modifying an existing entity or adding a new one:
1. Generate a new migration file following the project's naming convention (e.g., `V<Version>__<Description>.sql`).
2. Write the necessary DDL statements (CREATE, ALTER, DROP).
3. Ensure the migration is tested locally before pushing to the `main` branch.
