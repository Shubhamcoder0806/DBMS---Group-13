# 🍔 Online Food Ordering System — DBMS Project

A complete, normalized relational database design and SQL implementation
for a food delivery platform (in the style of Zomato/Swiggy), built as a
university-grade DBMS project and portfolio showcase.

![SQL](https://img.shields.io/badge/SQL-MySQL%208.0-4479A1?logo=mysql&logoColor=white)
![Status](https://img.shields.io/badge/status-completed-brightgreen)
![License](https://img.shields.io/badge/license-MIT-blue)

---

## 📖 Project Overview

The **Online Food Ordering System** models the core database backbone of a
food delivery platform: customers browse restaurants, order menu items,
pay for their orders, and have them delivered by a delivery agent. The
project focuses purely on **database design and SQL** — schema
normalization, data integrity, query writing, and formal query languages
(Relational Algebra and Relational Calculus) — making it ideal for a DBMS
course submission, GitHub portfolio, or technical interview discussion.

---

## 🎯 Objectives

- Design a **normalized relational schema** (up to 3NF) for a real-world
  food ordering domain.
- Implement the schema using standard **SQL DDL** with proper constraints.
- Populate the database with **realistic, referentially consistent** sample
  data.
- Demonstrate proficiency in **SQL DML** — from basic filtering to joins,
  subqueries, views, and analytical business queries.
- Formally express representative queries using **Relational Algebra** and
  **Relational Calculus** (TRC & DRC).
- Present the project in a **professional, recruiter-ready** format.

---

## ✨ Features

- 8-entity normalized schema covering the full order lifecycle.
- Referential integrity enforced via foreign keys, `CHECK` constraints, and
  `UNIQUE` constraints.
- 100+ rows of interlinked, realistic sample data.
- 35+ documented SQL queries spanning every major SQL concept taught in a
  DBMS course.
- 12 Relational Algebra expressions and 12 Relational Calculus expressions
  (TRC + DRC) with explanations.
- Mermaid-based ER diagram, renderable directly on GitHub.
- Business-oriented analytical queries (top customers, restaurant revenue,
  monthly trends, delivery performance).

---

## 🧩 System Modules

| Module              | Responsibility                                             |
|----------------------|--------------------------------------------------------------|
| **Customer Module**   | Customer registration and profile data                      |
| **Restaurant Module** | Restaurant listings and menu management                     |
| **Ordering Module**   | Order placement and order-line (item) tracking               |
| **Payment Module**    | Payment method, status, and transaction tracking             |
| **Delivery Module**   | Delivery agent assignment and delivery status tracking       |

---

## 🗄️ Database Design Overview

The schema is organized around a central **Orders** entity that connects
customers to restaurants, with satellite entities capturing menu content,
line-item detail, payment, and delivery execution.

| Table          | Purpose                                                        |
|-----------------|------------------------------------------------------------------|
| `Customer`      | Registered end users who place orders                           |
| `Restaurant`    | Partner restaurants on the platform                              |
| `MenuItem`      | Dishes/products offered by each restaurant                       |
| `Orders`        | Order header — links a customer, restaurant, status, and total   |
| `OrderItem`     | Line items of an order (resolves Orders ↔ MenuItem, M:N → 1:N)   |
| `Payment`       | Payment transaction details for an order (1:1 with Orders)       |
| `DeliveryAgent` | Delivery personnel available on the platform                     |
| `Delivery`      | Delivery execution details for an order (1:1 with Orders)        |

The design is normalized to **Third Normal Form (3NF)**: every non-key
attribute depends on the whole primary key and nothing but the primary key,
eliminating redundancy (e.g., restaurant details are never duplicated into
`Orders` or `MenuItem`; pricing at time of purchase is captured explicitly
in `OrderItem.unit_price` to avoid anomalies if a menu price later changes).

---
## Functional Dependencies

Customer:
customer_id → customer_name, email, phone

Restaurant:
restaurant_id → restaurant_name, address

MenuItem:
item_id → item_name, price, restaurant_id

Orders:
order_id → customer_id, restaurant_id, order_date, total_amount, status

OrderItem:
order_item_id → order_id, item_id, quantity, unit_price

Payment:
payment_id → order_id, payment_method, payment_status

DeliveryAgent:
agent_id → agent_name, phone

Delivery:
delivery_id → order_id, agent_id, delivery_status


## 🔗 Entity Relationship Overview

- **Customer (1) → (N) Orders** — a customer can place many orders.
- **Restaurant (1) → (N) Orders** — a restaurant can receive many orders.
- **Restaurant (1) → (N) MenuItem** — a restaurant offers many menu items.
- **Orders (1) → (N) OrderItem** and **MenuItem (1) → (N) OrderItem** — the
  associative entity `OrderItem` resolves the Orders↔MenuItem many-to-many
  relationship.
- **Orders (1) → (1) Payment** — every order has exactly one payment record.
- **Orders (1) → (1) Delivery** — every order has exactly one delivery record.
- **DeliveryAgent (1) → (N) Delivery** — an agent can handle many deliveries.

See [`er_diagram.md`](./er_diagram.md) for the full Mermaid ER diagram and
attribute-level breakdown.

---

## 🛠️ Technology Stack

| Layer               | Technology                     |
|----------------------|---------------------------------|
| Database Engine       | MySQL 8.0+                     |
| Query Language        | SQL (DDL, DML, DQL)            |
| Formal Query Modeling | Relational Algebra, Relational Calculus (TRC/DRC) |
| Diagramming           | Mermaid.js (`erDiagram`)       |
| Documentation         | Markdown                        |

---

## 📁 Project Structure

```
Online-Food-Ordering-System/
│
├── README.md                   # Project documentation (this file)
├── schema.sql                  # DDL — database & table creation
├── insert_data.sql             # DML — realistic sample data
├── queries.sql                 # 35+ documented SQL queries
├── relational_algebra.md       # Relational Algebra expressions
├── relational_calculus.md      # Tuple & Domain Relational Calculus
├── er_diagram.md                # ER diagram (Mermaid) + design notes
└── screenshots_description.md  # Guide for capturing result screenshots
```

---

## 🧮 Database Schema Summary

| Table          | Primary Key     | Foreign Keys                                      | Row Count (sample data) |
|-----------------|------------------|------------------------------------------------------|---------------------------|
| Customer        | customer_id      | —                                                      | 20                         |
| Restaurant      | restaurant_id    | —                                                      | 5                          |
| MenuItem        | item_id          | restaurant_id → Restaurant                             | 30                         |
| Orders          | order_id         | customer_id → Customer, restaurant_id → Restaurant     | 30                         |
| OrderItem       | order_item_id    | order_id → Orders, item_id → MenuItem                  | 50                         |
| Payment         | payment_id       | order_id → Orders (UNIQUE)                             | 30                         |
| DeliveryAgent   | agent_id         | —                                                      | 10                         |
| Delivery        | delivery_id      | order_id → Orders (UNIQUE), agent_id → DeliveryAgent    | 30                         |

---

## 🔍 SQL Operations Used

`queries.sql` covers, in order:

- **Basic Queries** — `SELECT`, `WHERE`, `DISTINCT`, `ORDER BY`, `LIMIT`
- **Aggregate Functions** — `COUNT`, `SUM`, `AVG`, `MAX`, `MIN`
- **Grouping** — `GROUP BY`, `HAVING`
- **Joins** — `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`
- **Subqueries** — nested `SELECT`, `EXISTS`, `IN`
- **Views** — `CREATE VIEW` for reusable reporting logic
- **Business Analytics** — top customers, most-ordered items, restaurant
  revenue, monthly revenue trend, delivery statistics, pending deliveries,
  average order value, and more

---

## 🧠 Relational Algebra Overview

`relational_algebra.md` formally expresses 12 representative queries using
core operators — **σ (select), π (project), ⋈ (join), ∪ (union), −
(difference), ÷ (division)** — including derived-operator use cases like
finding customers with no orders and restaurants that sell in every city.

---

## 🧠 Relational Calculus Overview

`relational_calculus.md` expresses the same class of queries using
**Tuple Relational Calculus (TRC)** and **Domain Relational Calculus
(DRC)**, using quantifiers (∃, ∀) to model conditions such as "customers
who ordered from every restaurant" — directly illustrating the theoretical
foundation SQL is built on.

---

## 💼 Sample Business Use Cases

1. **Customer Retention Analysis** — identify top-spending customers for
   loyalty programs (Query 28).
2. **Menu Optimization** — surface the most-ordered items per restaurant to
   guide inventory and promotions (Query 29).
3. **Restaurant Performance Reporting** — track revenue and average order
   value per restaurant for partner payouts (Queries 12, 34).
4. **Delivery Operations Monitoring** — track pending vs. completed
   deliveries and agent performance (Queries 31, 32, 35).
5. **Financial Reconciliation** — cross-check cancelled orders against
   payment/refund status (Query 37).

---

## 🚀 Future Enhancements

- Add a `Review` / `Rating` entity for customer feedback per order.
- Add a `Coupon` / `Discount` entity with a many-to-many link to `Orders`.
- Introduce `Address` as its own entity to support multiple saved addresses
  per customer.
- Add stored procedures/triggers (e.g., auto-updating `Orders.total_amount`
  when `OrderItem` rows change).
- Build a REST API or web front-end on top of this schema.
- Partition `Orders` by date range for large-scale performance testing.

---

## 🎓 Learning Outcomes

Through this project, the following DBMS concepts were applied end-to-end:

- Requirements analysis and conceptual (ER) modeling
- Normalization theory (1NF → 3NF) and anomaly avoidance
- Translating an ER model into a relational schema with DDL
- Writing constraint-safe, referentially consistent sample data
- Practical SQL across filtering, aggregation, joins, subqueries, and views
- Formal query languages (Relational Algebra & Calculus) as the theoretical
  basis for SQL
- Structuring a database project for professional/portfolio presentation

---

## ✅ Conclusion

This project demonstrates a complete, industry-relevant database design
workflow — from conceptual modeling through normalized schema
implementation to practical and formal query writing — for a realistic
food ordering platform. It is structured to be equally useful as a
**course submission**, a **GitHub portfolio piece**, and a **talking point
in technical interviews**.

---

## 📸 Screenshots

See [`screenshots_description.md`](./screenshots_description.md) for the
recommended set of screenshots to capture and reference here once the
scripts are run locally.

---

## 🧑‍💻 How to Run

```bash
# 1. Create schema
mysql -u root -p < schema.sql

# 2. Populate sample data
mysql -u root -p < insert_data.sql

# 3. Run queries
mysql -u root -p online_food_ordering_system < queries.sql
```

---

## 📄 License

This project is released under the MIT License — free to use for academic
and portfolio purposes.
