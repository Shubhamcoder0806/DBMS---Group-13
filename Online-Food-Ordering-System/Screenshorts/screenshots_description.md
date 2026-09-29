# Screenshots Description — Online Food Ordering System

This file documents the recommended screenshots to capture and include in
the repository's `/screenshots` folder for portfolio and viva presentation
purposes. Since this is a database-focused project, screenshots should
demonstrate schema execution, data population, and query results.

> Replace the placeholders below with actual images once you execute the
> scripts locally (e.g., in MySQL Workbench, DBeaver, or the MySQL CLI),
> and update the relative paths to match your `/screenshots` folder.

---

## 1. Database & Table Creation

**File:** `screenshots/01_schema_creation.png`
**Description:** Output of running `schema.sql`, showing the
`online_food_ordering_system` database created successfully with all 8
tables (`Customer`, `Restaurant`, `MenuItem`, `Orders`, `OrderItem`,
`Payment`, `DeliveryAgent`, `Delivery`) listed via `SHOW TABLES;`.

## 2. Table Structure (DESCRIBE)

**File:** `screenshots/02_table_structure.png`
**Description:** Output of `DESCRIBE Orders;` or `DESCRIBE MenuItem;`
showing column names, data types, keys (PRI/UNI/MUL), and null
constraints — useful for verifying schema correctness during a viva.

## 3. Sample Data Insertion

**File:** `screenshots/03_data_insertion.png`
**Description:** Successful execution log of `insert_data.sql`, confirming
row counts inserted into each table without foreign key violations.

## 4. Entity Relationship Diagram

**File:** `screenshots/04_er_diagram.png`
**Description:** Rendered image of the Mermaid ER diagram from
`er_diagram.md` (can be exported via the Mermaid Live Editor at
mermaid.live, or GitHub's native Mermaid rendering).

## 5. Basic Query Output

**File:** `screenshots/05_basic_query.png`
**Description:** Result grid for Query 4 (menu items above ₹250, sorted by
price) — demonstrates WHERE + ORDER BY.

## 6. Aggregate Query Output

**File:** `screenshots/06_aggregate_query.png`
**Description:** Result grid for Query 12 (total revenue per restaurant) —
demonstrates JOIN + GROUP BY + SUM.

## 7. Join Query Output

**File:** `screenshots/07_join_query.png`
**Description:** Result grid for Query 20 (full order breakdown across
Orders, OrderItem, MenuItem, and Restaurant) — demonstrates multi-table
INNER JOIN.

## 8. Subquery Output

**File:** `screenshots/08_subquery.png`
**Description:** Result grid for Query 23 (restaurants with at least one
delivered order) — demonstrates EXISTS.

## 9. View Output

**File:** `screenshots/09_view_output.png`
**Description:** Result of `SELECT * FROM RestaurantRevenue ORDER BY
total_revenue DESC;` — demonstrates a CREATE VIEW in action.

## 10. Business Query Output

**File:** `screenshots/10_business_query.png`
**Description:** Result grid for Query 28 (top 5 customers by total spend)
— demonstrates a real-world analytical/business use case.

---

## Suggested Tools for Capturing Screenshots

- **MySQL Workbench** — best for schema diagrams (reverse-engineered ER
  view) and formatted query result grids.
- **DBeaver** — free, cross-platform SQL client with clean result-grid
  screenshots.
- **Mermaid Live Editor** (https://mermaid.live) — for exporting the ER
  diagram from `er_diagram.md` as a PNG/SVG.
- **MySQL CLI + terminal screenshot** — acceptable for a lightweight,
  no-GUI portfolio style.

## Recommended Folder Structure

```
Online-Food-Ordering-System/
└── screenshots/
    ├── 01_schema_creation.png
    ├── 02_table_structure.png
    ├── 03_data_insertion.png
    ├── 04_er_diagram.png
    ├── 05_basic_query.png
    ├── 06_aggregate_query.png
    ├── 07_join_query.png
    ├── 08_subquery.png
    ├── 09_view_output.png
    └── 10_business_query.png
```

Reference these images in `README.md` under a "Screenshots" section using:

```markdown
![Schema Creation](screenshots/01_schema_creation.png)
```
