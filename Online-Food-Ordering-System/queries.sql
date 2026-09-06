-- ============================================================
-- Online Food Ordering System
-- File: queries.sql
-- Description: 30+ SQL queries demonstrating core DBMS concepts
-- (basic retrieval, aggregation, grouping, joins, subqueries,
-- views, and business-oriented analytical queries).
-- Run AFTER schema.sql and insert_data.sql.
-- ============================================================

USE online_food_ordering_system;

-- ============================================================
-- SECTION A: BASIC QUERIES
-- ============================================================

-- Q1. List all customers along with their city.
-- Demonstrates: SELECT, basic projection
SELECT full_name, email, city
FROM Customer;

-- Q2. Find all customers who live in 'Pune'.
-- Demonstrates: WHERE clause filtering
SELECT full_name, phone, address
FROM Customer
WHERE city = 'Pune';

-- Q3. List all distinct cities the platform operates in (customers + restaurants).
-- Demonstrates: DISTINCT, UNION
SELECT DISTINCT city FROM Customer
UNION
SELECT DISTINCT city FROM Restaurant;

-- Q4. List all menu items priced above ₹250, sorted from most to least expensive.
-- Demonstrates: WHERE + ORDER BY
SELECT item_name, category, price
FROM MenuItem
WHERE price > 250
ORDER BY price DESC;

-- Q5. Fetch the 5 most recently placed orders.
-- Demonstrates: ORDER BY + LIMIT
SELECT order_id, customer_id, order_date, order_status
FROM Orders
ORDER BY order_date DESC
LIMIT 5;

-- Q6. List all distinct cuisine types offered on the platform.
-- Demonstrates: DISTINCT
SELECT DISTINCT cuisine_type
FROM Restaurant;

-- ============================================================
-- SECTION B: AGGREGATE QUERIES
-- ============================================================

-- Q7. Count the total number of registered customers.
-- Demonstrates: COUNT
SELECT COUNT(*) AS total_customers
FROM Customer;

-- Q8. Find the total revenue generated across all successful payments.
-- Demonstrates: SUM + WHERE
SELECT SUM(amount) AS total_revenue
FROM Payment
WHERE payment_status = 'Success';

-- Q9. Find the average order value across the platform.
-- Demonstrates: AVG
SELECT ROUND(AVG(total_amount), 2) AS average_order_value
FROM Orders;

-- Q10. Find the highest-priced and lowest-priced menu item in the system.
-- Demonstrates: MAX, MIN
SELECT MAX(price) AS most_expensive_item, MIN(price) AS cheapest_item
FROM MenuItem;

-- Q11. Count how many orders each order_status currently has.
-- Demonstrates: COUNT with GROUP BY
SELECT order_status, COUNT(*) AS status_count
FROM Orders
GROUP BY order_status;

-- ============================================================
-- SECTION C: GROUPING (GROUP BY / HAVING)
-- ============================================================

-- Q12. Find total revenue earned by each restaurant.
-- Demonstrates: JOIN + GROUP BY + SUM
SELECT r.restaurant_name, SUM(o.total_amount) AS total_revenue
FROM Orders o
JOIN Restaurant r ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
ORDER BY total_revenue DESC;

-- Q13. Find restaurants whose total revenue exceeds ₹3000.
-- Demonstrates: GROUP BY + HAVING
SELECT r.restaurant_name, SUM(o.total_amount) AS total_revenue
FROM Orders o
JOIN Restaurant r ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
HAVING SUM(o.total_amount) > 3000;

-- Q14. Find customers who have placed more than 2 orders.
-- Demonstrates: GROUP BY + HAVING
SELECT c.full_name, COUNT(o.order_id) AS orders_placed
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.full_name
HAVING COUNT(o.order_id) > 2;

-- Q15. Find the number of menu items offered by each restaurant, per category.
-- Demonstrates: Multi-column GROUP BY
SELECT r.restaurant_name, m.category, COUNT(*) AS item_count
FROM MenuItem m
JOIN Restaurant r ON m.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name, m.category
ORDER BY r.restaurant_name;

-- ============================================================
-- SECTION D: JOIN QUERIES
-- ============================================================

-- Q16. List every order with the customer's name and restaurant name.
-- Demonstrates: INNER JOIN (multiple tables)
SELECT o.order_id, c.full_name AS customer_name, r.restaurant_name, o.order_status, o.total_amount
FROM Orders o
INNER JOIN Customer c ON o.customer_id = c.customer_id
INNER JOIN Restaurant r ON o.restaurant_id = r.restaurant_id;

-- Q17. List all customers along with their orders, including customers who
-- have never placed an order.
-- Demonstrates: LEFT JOIN
SELECT c.full_name, o.order_id, o.order_status
FROM Customer c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

-- Q18. List all menu items along with the order quantity, including menu
-- items that have never been ordered.
-- Demonstrates: LEFT JOIN
SELECT m.item_name, m.restaurant_id, oi.quantity
FROM MenuItem m
LEFT JOIN OrderItem oi ON m.item_id = oi.item_id;

-- Q19. List all delivery agents along with any deliveries assigned to them,
-- including agents currently assigned nothing (simulated with RIGHT JOIN).
-- Demonstrates: RIGHT JOIN
SELECT d.delivery_id, d.delivery_status, a.full_name AS agent_name
FROM Delivery d
RIGHT JOIN DeliveryAgent a ON d.agent_id = a.agent_id;

-- Q20. Full order breakdown: order -> items -> menu item names -> restaurant.
-- Demonstrates: Multi-table INNER JOIN
SELECT o.order_id, r.restaurant_name, mi.item_name, oi.quantity, oi.subtotal
FROM Orders o
JOIN OrderItem oi ON o.order_id = oi.order_id
JOIN MenuItem mi ON oi.item_id = mi.item_id
JOIN Restaurant r ON o.restaurant_id = r.restaurant_id
ORDER BY o.order_id;

-- ============================================================
-- SECTION E: SUBQUERIES
-- ============================================================

-- Q21. Find customers who have never placed an order.
-- Demonstrates: Nested SELECT with NOT IN
SELECT full_name, email
FROM Customer
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Orders);

-- Q22. Find all orders whose total_amount is above the platform's average order value.
-- Demonstrates: Nested SELECT (scalar subquery)
SELECT order_id, customer_id, total_amount
FROM Orders
WHERE total_amount > (SELECT AVG(total_amount) FROM Orders);

-- Q23. Find restaurants that have at least one order marked 'Delivered'.
-- Demonstrates: EXISTS
SELECT r.restaurant_name
FROM Restaurant r
WHERE EXISTS (
    SELECT 1 FROM Orders o
    WHERE o.restaurant_id = r.restaurant_id AND o.order_status = 'Delivered'
);

-- Q24. Find menu items that belong to restaurants with a rating above 4.0.
-- Demonstrates: IN subquery
SELECT item_name, price
FROM MenuItem
WHERE restaurant_id IN (SELECT restaurant_id FROM Restaurant WHERE rating > 4.0);

-- Q25. Find the customer(s) with the single highest total spend.
-- Demonstrates: Subquery in WHERE with aggregate + correlated comparison
SELECT c.full_name, SUM(o.total_amount) AS total_spent
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.full_name
HAVING SUM(o.total_amount) = (
    SELECT MAX(customer_total)
    FROM (SELECT SUM(total_amount) AS customer_total FROM Orders GROUP BY customer_id) AS totals
);

-- ============================================================
-- SECTION F: VIEWS
-- ============================================================

-- Q26. Create a view summarizing each order with customer and restaurant details.
-- Demonstrates: CREATE VIEW (simplifies repeated complex joins for reporting)
CREATE OR REPLACE VIEW OrderSummary AS
SELECT o.order_id, c.full_name AS customer_name, r.restaurant_name,
       o.order_date, o.order_status, o.total_amount
FROM Orders o
JOIN Customer c ON o.customer_id = c.customer_id
JOIN Restaurant r ON o.restaurant_id = r.restaurant_id;

-- Usage example:
SELECT * FROM OrderSummary WHERE order_status = 'Delivered';

-- Q27. Create a view showing restaurant-wise revenue performance.
-- Demonstrates: CREATE VIEW with aggregation
CREATE OR REPLACE VIEW RestaurantRevenue AS
SELECT r.restaurant_id, r.restaurant_name, COUNT(o.order_id) AS total_orders,
       COALESCE(SUM(o.total_amount), 0) AS total_revenue
FROM Restaurant r
LEFT JOIN Orders o ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id, r.restaurant_name;

-- Usage example:
SELECT * FROM RestaurantRevenue ORDER BY total_revenue DESC;

-- ============================================================
-- SECTION G: BUSINESS QUERIES
-- ============================================================

-- Q28. Top 5 customers by total spend (most valuable customers).
SELECT c.full_name, SUM(o.total_amount) AS total_spent
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.full_name
ORDER BY total_spent DESC
LIMIT 5;

-- Q29. Most ordered menu items (by total quantity sold).
SELECT mi.item_name, SUM(oi.quantity) AS total_quantity_sold
FROM OrderItem oi
JOIN MenuItem mi ON oi.item_id = mi.item_id
GROUP BY mi.item_name
ORDER BY total_quantity_sold DESC
LIMIT 5;

-- Q30. Monthly revenue trend for the platform.
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(total_amount) AS monthly_revenue
FROM Orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;

-- Q31. Delivery performance statistics by status.
SELECT delivery_status, COUNT(*) AS total_deliveries
FROM Delivery
GROUP BY delivery_status;

-- Q32. List all pending deliveries (not yet delivered), with customer and restaurant info.
SELECT d.delivery_id, c.full_name AS customer_name, r.restaurant_name, d.delivery_status
FROM Delivery d
JOIN Orders o ON d.order_id = o.order_id
JOIN Customer c ON o.customer_id = c.customer_id
JOIN Restaurant r ON o.restaurant_id = r.restaurant_id
WHERE d.delivery_status NOT IN ('Delivered', 'Failed');

-- Q33. Highest spending customer per city.
SELECT city, full_name, total_spent
FROM (
    SELECT c.city, c.full_name, SUM(o.total_amount) AS total_spent,
           RANK() OVER (PARTITION BY c.city ORDER BY SUM(o.total_amount) DESC) AS rnk
    FROM Customer c
    JOIN Orders o ON c.customer_id = o.customer_id
    GROUP BY c.city, c.full_name
) ranked
WHERE rnk = 1;

-- Q34. Average order value per restaurant.
SELECT r.restaurant_name, ROUND(AVG(o.total_amount), 2) AS avg_order_value
FROM Orders o
JOIN Restaurant r ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
ORDER BY avg_order_value DESC;

-- Q35. Delivery agents ranked by number of completed deliveries.
SELECT a.full_name, COUNT(d.delivery_id) AS completed_deliveries
FROM DeliveryAgent a
JOIN Delivery d ON a.agent_id = d.agent_id
WHERE d.delivery_status = 'Delivered'
GROUP BY a.full_name
ORDER BY completed_deliveries DESC;

-- Q36. Payment method popularity across the platform.
SELECT payment_method, COUNT(*) AS times_used, SUM(amount) AS total_processed
FROM Payment
WHERE payment_status = 'Success'
GROUP BY payment_method
ORDER BY times_used DESC;

-- Q37. Cancelled orders and their associated payment status (for refund tracking).
SELECT o.order_id, c.full_name, o.total_amount, p.payment_status
FROM Orders o
JOIN Customer c ON o.customer_id = c.customer_id
JOIN Payment p ON o.order_id = p.order_id
WHERE o.order_status = 'Cancelled';
