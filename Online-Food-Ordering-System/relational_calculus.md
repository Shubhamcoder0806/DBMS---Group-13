# Relational Calculus — Online Food Ordering System

Relational Calculus is a **non-procedural** (declarative) query language —
it describes *what* result is wanted rather than *how* to compute it.
Two forms are used here:

- **Tuple Relational Calculus (TRC):** variables range over tuples.
  General form: `{ t | P(t) }` — the set of tuples `t` such that predicate
  `P(t)` is true.
- **Domain Relational Calculus (DRC):** variables range over individual
  domain values (attributes).
  General form: `{ <x1, x2, ...> | P(x1, x2, ...) }`.

Quantifiers used: ∃ (there exists), ∀ (for all), ∧ (AND), ∨ (OR), ¬ (NOT).

---

## Tuple Relational Calculus (TRC)

### 1. Find all customers located in 'Pune'

**Statement:** Retrieve full tuples of customers whose city is Pune.

**Expression:**
```
{ t | t ∈ Customer ∧ t.city = 'Pune' }
```

**Explanation:** `t` ranges over all tuples in `Customer`; the predicate
keeps only those where the `city` attribute equals 'Pune'.

---

### 2. Find restaurant names with rating above 4.0

**Statement:** Retrieve restaurant names for restaurants rated above 4.0.

**Expression:**
```
{ t.restaurant_name | t ∈ Restaurant ∧ t.rating > 4.0 }
```

**Explanation:** `t` ranges over `Restaurant`; only the `restaurant_name`
attribute of qualifying tuples is returned.

---

### 3. Find customers who have placed at least one order

**Statement:** Retrieve customers who appear as the customer of some order.

**Expression:**
```
{ c | c ∈ Customer ∧ (∃ o)(o ∈ Orders ∧ o.customer_id = c.customer_id) }
```

**Explanation:** The existential quantifier ∃ asserts that at least one
`Orders` tuple `o` exists whose `customer_id` matches the candidate
customer `c`.

---

### 4. Find customers who have never placed an order

**Statement:** Retrieve customers with zero matching order tuples.

**Expression:**
```
{ c | c ∈ Customer ∧ ¬(∃ o)(o ∈ Orders ∧ o.customer_id = c.customer_id) }
```

**Explanation:** The negated existential quantifier ¬∃ ensures no `Orders`
tuple references this customer.

---

### 5. Find menu items belonging to a specific restaurant ('Dragon Wok')

**Statement:** Retrieve menu item tuples served by 'Dragon Wok'.

**Expression:**
```
{ m | m ∈ MenuItem ∧ (∃ r)(r ∈ Restaurant ∧ r.restaurant_id = m.restaurant_id
        ∧ r.restaurant_name = 'Dragon Wok') }
```

**Explanation:** For each `MenuItem` tuple `m`, we check that a
corresponding `Restaurant` tuple `r` exists with a matching ID and the name
'Dragon Wok'.

---

### 6. Find orders with status 'Delivered'

**Statement:** Retrieve order tuples currently marked as delivered.

**Expression:**
```
{ o | o ∈ Orders ∧ o.order_status = 'Delivered' }
```

**Explanation:** A straightforward predicate restriction on the `Orders`
relation.

---

### 7. Find delivery agents who have at least one delivery still pending

**Statement:** Retrieve agents with an active (not yet completed) delivery.

**Expression:**
```
{ a | a ∈ DeliveryAgent ∧ (∃ d)(d ∈ Delivery ∧ d.agent_id = a.agent_id
        ∧ d.delivery_status ≠ 'Delivered' ∧ d.delivery_status ≠ 'Failed') }
```

**Explanation:** Existential quantification checks for a `Delivery` tuple
tied to the agent whose status is neither 'Delivered' nor 'Failed'.

---

### 8. Find customers who ordered from ALL restaurants (universal quantification)

**Statement:** Retrieve customers who have placed at least one order at
every restaurant on the platform.

**Expression:**
```
{ c | c ∈ Customer ∧ (∀ r)(r ∈ Restaurant ⟹
        (∃ o)(o ∈ Orders ∧ o.customer_id = c.customer_id
              ∧ o.restaurant_id = r.restaurant_id)) }
```

**Explanation:** The universal quantifier ∀ requires that for every
restaurant `r`, there exists a corresponding order `o` linking the customer
to that restaurant — modeling a "for all" (division-style) business
condition.

---

## Domain Relational Calculus (DRC)

### 9. Find names and emails of customers in 'Bhopal'

**Statement:** Retrieve name/email pairs for customers located in Bhopal.

**Expression:**
```
{ <name, email> | (∃ id, phone, addr, city, regdate)
      ( <id, name, email, phone, addr, city, regdate> ∈ Customer ∧ city = 'Bhopal' ) }
```

**Explanation:** Domain variables `name` and `email` are the only ones
returned; the remaining domain variables are existentially quantified to
"complete" the tuple shape while the `city = 'Bhopal'` condition filters it.

---

### 10. Find item names and prices of menu items priced under ₹150

**Statement:** Retrieve name and price of budget-friendly menu items.

**Expression:**
```
{ <name, price> | (∃ id, rid, cat, avail)
      ( <id, rid, name, cat, price, avail> ∈ MenuItem ∧ price < 150 ) }
```

**Explanation:** Domain variables `name` and `price` are output; other
attributes of `MenuItem` are existentially bound, and the price condition
restricts the result.

---

### 11. Find order IDs and totals for orders exceeding ₹500

**Statement:** Retrieve order ID and total amount for high-value orders.

**Expression:**
```
{ <oid, total> | (∃ cid, rid, date, status)
      ( <oid, cid, rid, date, status, total> ∈ Orders ∧ total > 500 ) }
```

**Explanation:** `oid` and `total` are projected out as domain variables;
the remaining `Orders` attributes are existentially quantified, and the
condition `total > 500` filters qualifying rows.

---

### 12. Find restaurant names and cities for restaurants in 'Kanpur'

**Statement:** Retrieve name and city of restaurants located in Kanpur.

**Expression:**
```
{ <rname, city> | (∃ id, cuisine, addr, phone, rating)
      ( <id, rname, cuisine, addr, city, phone, rating> ∈ Restaurant ∧ city = 'Kanpur' ) }
```

**Explanation:** Only `rname` (restaurant_name) and `city` are returned as
free domain variables; the condition restricts results to Kanpur-based
restaurants.

---

## Comparison: TRC vs DRC

| Aspect                | TRC                              | DRC                                       |
|------------------------|-----------------------------------|--------------------------------------------|
| Variable ranges over   | Whole tuples                      | Individual domain (attribute) values      |
| Result granularity     | Entire tuple or tuple attribute   | Explicit list of attribute values          |
| Readability            | Closer to natural relational form | More verbose; every attribute is named     |
| Underlying language    | Basis for SQL's `SELECT` semantics| Basis for query languages like QBE         |

## Relationship to SQL

Both TRC and DRC are **declarative** and formally equivalent in expressive
power to Relational Algebra (per Codd's theorem) for queries without
aggregation. SQL is heavily influenced by TRC — the `SELECT ... WHERE`
structure directly mirrors `{ t | P(t) }` predicate filtering.
