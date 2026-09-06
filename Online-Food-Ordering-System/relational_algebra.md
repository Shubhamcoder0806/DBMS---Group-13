# Relational Algebra — Online Food Ordering System

Relational Algebra is a procedural query language that operates on relations
(tables) and produces relations as output. It uses the fundamental operators
of selection (σ), projection (π), join (⋈), union (∪), set difference (−),
Cartesian product (×), and rename (ρ), along with derived operators such as
division (÷) and aggregation (𝔊).

**Notation used below:**

| Symbol | Meaning              |
|--------|----------------------|
| σ      | Selection            |
| π      | Projection           |
| ⋈      | Natural Join         |
| ∪      | Union                |
| −      | Set Difference       |
| ×      | Cartesian Product    |
| ρ      | Rename               |
| ÷      | Division             |
| 𝔊      | Aggregate / Group By |

---

### 1. Retrieve the names of all customers located in Pune

**Statement:** Find full names of customers whose city is 'Pune'.

**Expression:**
```
π full_name (σ city = 'Pune' (Customer))
```

**Explanation:** The selection operator (σ) filters `Customer` tuples where
`city = 'Pune'`, then the projection operator (π) retains only the
`full_name` attribute from the resulting rows.

---

### 2. Find customers who have placed at least one order

**Statement:** List distinct customers who appear in the Orders relation.

**Expression:**
```
π full_name (Customer ⋈ Customer.customer_id = Orders.customer_id Orders)
```

**Explanation:** A natural join between `Customer` and `Orders` on
`customer_id` produces only customers who have a matching order tuple;
projection then extracts their names.

---

### 3. Find customers who have never placed an order

**Statement:** List customers absent from the Orders relation.

**Expression:**
```
π customer_id (Customer) − π customer_id (Orders)
```

**Explanation:** Set difference (−) removes every `customer_id` that exists
in `Orders` from the full set of customer IDs, leaving only customers with
zero orders.

---

### 4. Find restaurants with a rating greater than 4.0

**Statement:** Retrieve restaurant names where rating exceeds 4.0.

**Expression:**
```
π restaurant_name (σ rating > 4.0 (Restaurant))
```

**Explanation:** Selection filters `Restaurant` tuples on the rating
condition; projection then outputs only the restaurant name.

---

### 5. Find menu items ordered from a specific restaurant (e.g., 'Pizza Vibe')

**Statement:** List menu item names belonging to the restaurant 'Pizza Vibe'.

**Expression:**
```
π item_name (σ restaurant_name = 'Pizza Vibe' (Restaurant ⋈ MenuItem))
```

**Explanation:** The natural join links `Restaurant` and `MenuItem` on
`restaurant_id`. Selection narrows the joined relation to rows where
`restaurant_name = 'Pizza Vibe'`, and projection isolates `item_name`.

---

### 6. Find orders that have been delivered

**Statement:** Retrieve all order tuples with status 'Delivered'.

**Expression:**
```
σ order_status = 'Delivered' (Orders)
```

**Explanation:** A direct selection on the `Orders` relation using the
`order_status` predicate.

---

### 7. Find customers who ordered from restaurant with restaurant_id = 2

**Statement:** List names of customers who placed at least one order from
restaurant 2.

**Expression:**
```
π full_name (Customer ⋈ (σ restaurant_id = 2 (Orders)))
```

**Explanation:** Selection first restricts `Orders` to only restaurant 2's
orders. This filtered relation is then joined with `Customer` on
`customer_id`, and projection returns customer names.

---

### 8. Find the most popular menu items (ordered by more than one order)

**Statement:** Retrieve names of menu items that appear in more than one
distinct order.

**Expression:**
```
π item_name ( σ order_count > 1 ( 𝔊 item_id 𝔊COUNT(DISTINCT order_id) AS order_count (OrderItem) ⋈ MenuItem) )
```

**Explanation:** The aggregate operator (𝔊) groups `OrderItem` tuples by
`item_id` and counts distinct associated orders. Selection then keeps items
ordered more than once, the result is joined with `MenuItem` to recover
item names, and projection extracts the final attribute.

---

### 9. Find delivery agents who have completed at least one delivery

**Statement:** List agent names with a delivery marked 'Delivered'.

**Expression:**
```
π full_name (DeliveryAgent ⋈ (σ delivery_status = 'Delivered' (Delivery)))
```

**Explanation:** Selection isolates completed delivery tuples; the natural
join with `DeliveryAgent` on `agent_id` attaches agent details, and
projection returns just the agent's name.

---

### 10. Find restaurants that have sales in every city where the platform operates

**Statement:** Identify restaurant(s) that have received an order from a
customer located in every distinct city.

**Expression:**
```
π restaurant_name ( ( π restaurant_id, city (Orders ⋈ Customer) ) ÷ ( π city (Customer) ) ⋈ Restaurant )
```

**Explanation:** This uses the division operator (÷) — a derived operator
built from projection, Cartesian product, and set difference — to find
restaurants whose set of customer-cities is a superset of *all* distinct
cities in the platform. The result is joined with `Restaurant` to recover
readable names.

---

### 11. Find restaurants with total revenue above ₹3000

**Statement:** Retrieve restaurant names whose summed order total exceeds
₹3000.

**Expression:**
```
π restaurant_name ( σ total_revenue > 3000 ( 𝔊 restaurant_id 𝔊SUM(total_amount) AS total_revenue (Orders) ⋈ Restaurant ) )
```

**Explanation:** The aggregate operator groups `Orders` by `restaurant_id`
and computes the summed `total_amount` as `total_revenue`. Selection filters
groups above ₹3000, the result is joined with `Restaurant`, and projection
returns the name.

---

### 12. Find the intersection of customers who ordered Italian food AND North Indian food

**Statement:** List customers who have ordered from at least one Italian
restaurant and at least one North Indian restaurant.

**Expression:**
```
π customer_id (σ cuisine_type='Italian' (Orders ⋈ Restaurant))
    ∩
π customer_id (σ cuisine_type='North Indian' (Orders ⋈ Restaurant))
```

*(Intersection (∩) is a derived operator: A ∩ B = A − (A − B).)*

**Explanation:** Two independently filtered/projected sets of `customer_id`
values are intersected to find customers common to both cuisine
preferences.

---

## Summary of Operators Demonstrated

| # | Query                                   | Operators Used            |
|---|------------------------------------------|----------------------------|
| 1 | Customers in Pune                        | σ, π                       |
| 2 | Customers who placed orders              | π, ⋈                       |
| 3 | Customers with no orders                 | π, −                       |
| 4 | Restaurants rated > 4.0                  | σ, π                       |
| 5 | Menu items of a specific restaurant      | σ, π, ⋈                    |
| 6 | Delivered orders                         | σ                          |
| 7 | Customers of restaurant_id = 2           | σ, π, ⋈                    |
| 8 | Most popular menu items                  | 𝔊, σ, π, ⋈                 |
| 9 | Agents with completed deliveries         | σ, π, ⋈                    |
| 10| Restaurants selling in every city        | π, ÷, ⋈                    |
| 11| Restaurants with revenue > ₹3000         | 𝔊, σ, π, ⋈                 |
| 12| Customers ordering two cuisine types     | σ, π, ∩ (derived)          |
