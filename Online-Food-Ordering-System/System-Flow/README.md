# 🔄 Online Food Ordering System — Process Flow

## 📌 Overview

This diagram illustrates the complete working flow of the Online Food Ordering System, from customer login and restaurant browsing to order placement, payment, food preparation, delivery, and order completion.

The system is implemented as a normalized relational database using MySQL and consists of eight core entities:

- Customer
- Restaurant
- MenuItem
- Orders
- OrderItem
- Payment
- DeliveryAgent
- Delivery

## 🔄 System Workflow

The overall process works as follows:

1. **Customer Registration / Login**
   - The customer creates an account or logs into an existing account.

2. **Browse Restaurants**
   - The customer views available restaurants and their details.

3. **View Menu**
   - The customer selects a restaurant and views its available menu items.

4. **Add Items & Place Order**
   - Selected menu items are added to the order.
   - The order and individual order items are recorded in the database.

5. **Payment**
   - The customer selects a payment method.
   - Payment information is stored and associated with the order.

6. **Restaurant Processing**
   - The restaurant receives the order and prepares the food.
   - The order status is updated during processing.

7. **Delivery Assignment**
   - A delivery agent is assigned to the order.
   - Delivery information is recorded in the database.

8. **Order Delivery**
   - The delivery agent collects the order from the restaurant and delivers it to the customer.
   - Delivery status is updated accordingly.

9. **Order Completion**
   - The customer receives the food and the order reaches its completed/delivered state.

## 🗄️ Database Interaction

The workflow is supported by the following relationships:

- One customer can place many orders.
- One restaurant can receive many orders.
- One restaurant can have many menu items.
- One order can contain multiple order items.
- One menu item can appear in multiple order items.
- Each order has one payment record.
- Each order has one delivery record.
- One delivery agent can handle multiple deliveries.

## 🧩 Core Database Entities

| Entity | Purpose |
|---|---|
| `Customer` | Stores registered customers |
| `Restaurant` | Stores restaurant information |
| `MenuItem` | Stores food items offered by restaurants |
| `Orders` | Stores order-level information |
| `OrderItem` | Stores individual items within an order |
| `Payment` | Stores payment transaction details |
| `DeliveryAgent` | Stores delivery personnel |
| `Delivery` | Stores delivery execution details |

## 📊 Process Flow Diagram

![Online Food Ordering System Process Flow](process-flow.png)

## 🛠️ Technology

- **Database:** MySQL 8.0+
- **Query Language:** SQL
- **Database Design:** Normalized relational schema up to 3NF
- **Diagram:** Process-flow infographic

---

## 🎯 Purpose

The purpose of this process flow is to provide a visual representation of how the major components of the database interact throughout the food-ordering lifecycle.

It complements the project's ER diagram and SQL implementation.
