-- ============================================================
-- Online Food Ordering System
-- File: insert_data.sql
-- Description: Sample data population script.
-- Run AFTER schema.sql. Maintains full referential integrity.
-- ============================================================

USE online_food_ordering_system;

-- ------------------------------------------------------------
-- Customers (20 rows)
-- ------------------------------------------------------------
INSERT INTO Customer (customer_id, full_name, email, phone, address, city, registration_date) VALUES
(1, 'Vihaan Sharma', 'vihaan.sharma1@example.com', '9896233790', '63 Park Street, Pune', 'Pune', '2025-03-24'),
(2, 'Vihaan Nair', 'vihaan.nair2@example.com', '9193349856', '109 MG Road, Kanpur', 'Kanpur', '2025-01-03'),
(3, 'Reyansh Mishra', 'reyansh.mishra3@example.com', '9642621108', '7 Green Avenue, Kanpur', 'Kanpur', '2025-04-23'),
(4, 'Riya Patel', 'riya.patel4@example.com', '9336696312', '151 Civil Lines, Bhopal', 'Bhopal', '2025-01-25'),
(5, 'Sai Patel', 'sai.patel5@example.com', '9465341213', '40 Park Street, Pune', 'Pune', '2025-06-04'),
(6, 'Aditya Patel', 'aditya.patel6@example.com', '9203848421', '89 Green Avenue, Jaipur', 'Jaipur', '2025-05-26'),
(7, 'Vivaan Reddy', 'vivaan.reddy7@example.com', '9675770529', '97 MG Road, Indore', 'Indore', '2025-09-10'),
(8, 'Navya Singh', 'navya.singh8@example.com', '9719927151', '181 MG Road, Lucknow', 'Lucknow', '2025-01-22'),
(9, 'Krishna Yadav', 'krishna.yadav9@example.com', '9185675980', '26 Sector 12, Lucknow', 'Lucknow', '2025-05-15'),
(10, 'Diya Gupta', 'diya.gupta10@example.com', '9497478786', '54 Civil Lines, Jaipur', 'Jaipur', '2025-12-22'),
(11, 'Aditya Iyer', 'aditya.iyer11@example.com', '9781802744', '137 Park Street, Kanpur', 'Kanpur', '2025-03-15'),
(12, 'Saanvi Yadav', 'saanvi.yadav12@example.com', '9787194506', '57 Civil Lines, Indore', 'Indore', '2025-01-08'),
(13, 'Vivaan Singh', 'vivaan.singh13@example.com', '9530747414', '17 Park Street, Pune', 'Pune', '2025-10-23'),
(14, 'Ananya Mishra', 'ananya.mishra14@example.com', '9803771909', '102 Sector 12, Bhopal', 'Bhopal', '2025-03-09'),
(15, 'Arjun Mishra', 'arjun.mishra15@example.com', '9899925830', '138 Civil Lines, Indore', 'Indore', '2025-12-19'),
(16, 'Aadhya Iyer', 'aadhya.iyer16@example.com', '9528853029', '57 Park Street, Jaipur', 'Jaipur', '2025-09-16'),
(17, 'Aditya Sharma', 'aditya.sharma17@example.com', '9217734861', '161 Park Street, Kanpur', 'Kanpur', '2025-11-14'),
(18, 'Navya Verma', 'navya.verma18@example.com', '9513140753', '153 Sector 12, Nagpur', 'Nagpur', '2025-09-09'),
(19, 'Riya Sharma', 'riya.sharma19@example.com', '9830448745', '175 Green Avenue, Indore', 'Indore', '2025-05-25'),
(20, 'Ananya Verma', 'ananya.verma20@example.com', '9415143362', '41 Sector 12, Nagpur', 'Nagpur', '2025-01-24');

-- ------------------------------------------------------------
-- Restaurants (5 rows)
-- ------------------------------------------------------------
INSERT INTO Restaurant (restaurant_id, restaurant_name, cuisine_type, address, city, contact_number, rating) VALUES
(1, 'Spice Route', 'North Indian', '129 Food Street, Pune', 'Pune', '8918150683', 3.8),
(2, 'Pizza Vibe', 'Italian', '77 Food Street, Indore', 'Indore', '8786066793', 4.2),
(3, 'Dragon Wok', 'Chinese', '40 Food Street, Lucknow', 'Lucknow', '8501486939', 4.6),
(4, 'Burger Barn', 'Fast Food', '136 Food Street, Indore', 'Indore', '8100614068', 4.3),
(5, 'South Spice', 'South Indian', '5 Food Street, Bhopal', 'Bhopal', '8220117054', 4.8);

-- ------------------------------------------------------------
-- Menu Items (30 rows)
-- ------------------------------------------------------------
INSERT INTO MenuItem (item_id, restaurant_id, item_name, category, price, is_available) VALUES
(1, 1, 'Butter Chicken', 'Main Course', 320.00, TRUE),
(2, 1, 'Paneer Tikka', 'Starter', 260.00, TRUE),
(3, 1, 'Dal Makhani', 'Main Course', 220.00, TRUE),
(4, 1, 'Garlic Naan', 'Bread', 60.00, TRUE),
(5, 1, 'Chicken Biryani', 'Main Course', 280.00, TRUE),
(6, 1, 'Gulab Jamun', 'Dessert', 90.00, TRUE),
(7, 2, 'Margherita Pizza', 'Pizza', 280.00, TRUE),
(8, 2, 'Pepperoni Pizza', 'Pizza', 340.00, TRUE),
(9, 2, 'Farmhouse Pizza', 'Pizza', 320.00, TRUE),
(10, 2, 'Garlic Bread', 'Sides', 150.00, TRUE),
(11, 2, 'Pasta Alfredo', 'Pasta', 260.00, TRUE),
(12, 2, 'Tiramisu', 'Dessert', 180.00, TRUE),
(13, 3, 'Veg Hakka Noodles', 'Noodles', 200.00, TRUE),
(14, 3, 'Chicken Manchurian', 'Main Course', 260.00, TRUE),
(15, 3, 'Spring Rolls', 'Starter', 180.00, TRUE),
(16, 3, 'Fried Rice', 'Main Course', 210.00, TRUE),
(17, 3, 'Chilli Paneer', 'Starter', 240.00, TRUE),
(18, 3, 'Schezwan Momos', 'Starter', 190.00, TRUE),
(19, 4, 'Classic Cheeseburger', 'Burger', 180.00, TRUE),
(20, 4, 'Veggie Burger', 'Burger', 150.00, TRUE),
(21, 4, 'Crispy Fries', 'Sides', 120.00, TRUE),
(22, 4, 'Chicken Nuggets', 'Sides', 160.00, TRUE),
(23, 4, 'Cold Coffee Shake', 'Beverage', 130.00, TRUE),
(24, 4, 'Choco Sundae', 'Dessert', 110.00, TRUE),
(25, 5, 'Masala Dosa', 'Main Course', 140.00, TRUE),
(26, 5, 'Idli Sambar', 'Main Course', 100.00, TRUE),
(27, 5, 'Medu Vada', 'Starter', 90.00, TRUE),
(28, 5, 'Uttapam', 'Main Course', 130.00, TRUE),
(29, 5, 'Filter Coffee', 'Beverage', 50.00, TRUE),
(30, 5, 'Rava Kesari', 'Dessert', 80.00, TRUE);

-- ------------------------------------------------------------
-- Orders (30 rows)
-- ------------------------------------------------------------
INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, order_status, total_amount) VALUES
(1, 10, 2, '2025-01-08 18:05:00', 'Confirmed', 880.00),
(2, 16, 1, '2025-09-25 11:08:00', 'Delivered', 1230.00),
(3, 18, 2, '2025-05-17 22:38:00', 'Delivered', 960.00),
(4, 7, 5, '2025-12-23 12:45:00', 'Delivered', 260.00),
(5, 12, 4, '2025-09-15 10:15:00', 'Out for Delivery', 180.00),
(6, 11, 1, '2025-10-18 12:37:00', 'Out for Delivery', 740.00),
(7, 3, 1, '2025-04-03 09:55:00', 'Delivered', 220.00),
(8, 17, 2, '2025-05-22 16:13:00', 'Delivered', 1240.00),
(9, 19, 5, '2025-08-08 21:30:00', 'Delivered', 720.00),
(10, 7, 1, '2025-02-22 15:22:00', 'Delivered', 220.00),
(11, 15, 1, '2025-11-21 19:06:00', 'Confirmed', 400.00),
(12, 11, 1, '2025-04-07 12:34:00', 'Delivered', 1060.00),
(13, 14, 2, '2025-05-15 12:55:00', 'Cancelled', 710.00),
(14, 15, 5, '2025-02-02 19:34:00', 'Delivered', 410.00),
(15, 3, 2, '2025-03-14 16:30:00', 'Out for Delivery', 840.00),
(16, 13, 1, '2025-03-13 09:24:00', 'Delivered', 780.00),
(17, 15, 3, '2025-07-23 20:50:00', 'Delivered', 1120.00),
(18, 16, 2, '2025-04-10 12:03:00', 'Delivered', 780.00),
(19, 18, 1, '2025-12-11 09:03:00', 'Delivered', 520.00),
(20, 17, 5, '2025-03-02 17:05:00', 'Delivered', 150.00),
(21, 3, 5, '2025-02-22 22:15:00', 'Delivered', 280.00),
(22, 19, 2, '2025-10-20 09:39:00', 'Confirmed', 1760.00),
(23, 19, 5, '2025-09-11 13:13:00', 'Delivered', 300.00),
(24, 11, 2, '2025-05-13 11:42:00', 'Delivered', 1020.00),
(25, 15, 3, '2025-02-01 16:39:00', 'Cancelled', 760.00),
(26, 4, 1, '2025-09-07 17:16:00', 'Preparing', 1790.00),
(27, 12, 1, '2025-04-12 13:10:00', 'Delivered', 840.00),
(28, 18, 3, '2025-10-26 19:33:00', 'Placed', 660.00),
(29, 18, 3, '2025-11-04 11:16:00', 'Preparing', 260.00),
(30, 4, 5, '2025-03-09 13:38:00', 'Out for Delivery', 310.00);

-- ------------------------------------------------------------
-- Order Items (50 rows)
-- ------------------------------------------------------------
INSERT INTO OrderItem (order_item_id, order_id, item_id, quantity, unit_price) VALUES
(1, 1, 9, 1, 320.00),
(2, 2, 6, 3, 90.00),
(3, 3, 9, 3, 320.00),
(4, 4, 28, 2, 130.00),
(5, 5, 19, 1, 180.00),
(6, 6, 6, 2, 90.00),
(7, 7, 3, 1, 220.00),
(8, 8, 7, 2, 280.00),
(9, 9, 26, 3, 100.00),
(10, 10, 3, 1, 220.00),
(11, 11, 6, 2, 90.00),
(12, 12, 5, 3, 280.00),
(13, 13, 10, 3, 150.00),
(14, 14, 25, 1, 140.00),
(15, 15, 7, 3, 280.00),
(16, 16, 2, 3, 260.00),
(17, 17, 13, 2, 200.00),
(18, 18, 11, 3, 260.00),
(19, 19, 2, 2, 260.00),
(20, 20, 26, 1, 100.00),
(21, 21, 27, 2, 90.00),
(22, 22, 7, 2, 280.00),
(23, 23, 26, 3, 100.00),
(24, 24, 8, 3, 340.00),
(25, 25, 13, 2, 200.00),
(26, 26, 5, 2, 280.00),
(27, 27, 5, 3, 280.00),
(28, 28, 14, 1, 260.00),
(29, 29, 14, 1, 260.00),
(30, 30, 28, 1, 130.00),
(31, 30, 27, 2, 90.00),
(32, 26, 6, 3, 90.00),
(33, 26, 2, 2, 260.00),
(34, 28, 13, 2, 200.00),
(35, 8, 8, 2, 340.00),
(36, 12, 3, 1, 220.00),
(37, 22, 8, 2, 340.00),
(38, 11, 3, 1, 220.00),
(39, 25, 15, 2, 180.00),
(40, 21, 29, 2, 50.00),
(41, 22, 11, 2, 260.00),
(42, 1, 7, 2, 280.00),
(43, 6, 5, 2, 280.00),
(44, 2, 1, 3, 320.00),
(45, 14, 27, 3, 90.00),
(46, 26, 3, 2, 220.00),
(47, 20, 29, 1, 50.00),
(48, 13, 11, 1, 260.00),
(49, 9, 25, 3, 140.00),
(50, 17, 17, 3, 240.00);

-- ------------------------------------------------------------
-- Payments (30 rows)
-- ------------------------------------------------------------
INSERT INTO Payment (payment_id, order_id, payment_method, payment_status, payment_date, amount) VALUES
(1, 1, 'Debit Card', 'Pending', '2025-01-08 18:05:00', 880.00),
(2, 2, 'Net Banking', 'Success', '2025-09-25 11:08:00', 1230.00),
(3, 3, 'UPI', 'Success', '2025-05-17 22:38:00', 960.00),
(4, 4, 'Debit Card', 'Success', '2025-12-23 12:45:00', 260.00),
(5, 5, 'UPI', 'Success', '2025-09-15 10:15:00', 180.00),
(6, 6, 'Cash on Delivery', 'Success', '2025-10-18 12:37:00', 740.00),
(7, 7, 'Debit Card', 'Success', '2025-04-03 09:55:00', 220.00),
(8, 8, 'Net Banking', 'Success', '2025-05-22 16:13:00', 1240.00),
(9, 9, 'Debit Card', 'Success', '2025-08-08 21:30:00', 720.00),
(10, 10, 'Net Banking', 'Success', '2025-02-22 15:22:00', 220.00),
(11, 11, 'Cash on Delivery', 'Success', '2025-11-21 19:06:00', 400.00),
(12, 12, 'Credit Card', 'Success', '2025-04-07 12:34:00', 1060.00),
(13, 13, 'Net Banking', 'Refunded', '2025-05-15 12:55:00', 710.00),
(14, 14, 'Net Banking', 'Success', '2025-02-02 19:34:00', 410.00),
(15, 15, 'Cash on Delivery', 'Pending', '2025-03-14 16:30:00', 840.00),
(16, 16, 'Cash on Delivery', 'Success', '2025-03-13 09:24:00', 780.00),
(17, 17, 'Debit Card', 'Success', '2025-07-23 20:50:00', 1120.00),
(18, 18, 'Net Banking', 'Success', '2025-04-10 12:03:00', 780.00),
(19, 19, 'Cash on Delivery', 'Success', '2025-12-11 09:03:00', 520.00),
(20, 20, 'UPI', 'Success', '2025-03-02 17:05:00', 150.00),
(21, 21, 'Debit Card', 'Success', '2025-02-22 22:15:00', 280.00),
(22, 22, 'Credit Card', 'Success', '2025-10-20 09:39:00', 1760.00),
(23, 23, 'Net Banking', 'Success', '2025-09-11 13:13:00', 300.00),
(24, 24, 'Cash on Delivery', 'Success', '2025-05-13 11:42:00', 1020.00),
(25, 25, 'Net Banking', 'Failed', '2025-02-01 16:39:00', 760.00),
(26, 26, 'Net Banking', 'Success', '2025-09-07 17:16:00', 1790.00),
(27, 27, 'Credit Card', 'Success', '2025-04-12 13:10:00', 840.00),
(28, 28, 'Credit Card', 'Success', '2025-10-26 19:33:00', 660.00),
(29, 29, 'Debit Card', 'Pending', '2025-11-04 11:16:00', 260.00),
(30, 30, 'UPI', 'Success', '2025-03-09 13:38:00', 310.00);

-- ------------------------------------------------------------
-- Delivery Agents (10 rows)
-- ------------------------------------------------------------
INSERT INTO DeliveryAgent (agent_id, full_name, phone, vehicle_type, city) VALUES
(1, 'Rahul Kumar', '7978775497', 'Scooter', 'Pune'),
(2, 'Suresh Patil', '7341206079', 'Scooter', 'Kanpur'),
(3, 'Amit Joshi', '7126226563', 'Bike', 'Lucknow'),
(4, 'Vikram Rao', '7610173760', 'Bike', 'Bhopal'),
(5, 'Manoj Tiwari', '7545002643', 'Scooter', 'Nagpur'),
(6, 'Deepak Chauhan', '7630833445', 'Car', 'Lucknow'),
(7, 'Sanjay Meena', '7258453521', 'Bike', 'Indore'),
(8, 'Ravi Kanth', '7935822550', 'Car', 'Lucknow'),
(9, 'Farhan Ali', '7288856883', 'Car', 'Bhopal'),
(10, 'Yusuf Khan', '7698509918', 'Scooter', 'Indore');

-- ------------------------------------------------------------
-- Deliveries (30 rows)
-- ------------------------------------------------------------
INSERT INTO Delivery (delivery_id, order_id, agent_id, delivery_status, assigned_time, delivered_time) VALUES
(1, 1, 3, 'Picked Up', '2025-01-08 18:05:00', NULL),
(2, 2, 8, 'Delivered', '2025-09-25 11:08:00', '2025-09-25 12:08:00'),
(3, 3, 9, 'Delivered', '2025-05-17 22:38:00', '2025-05-17 23:38:00'),
(4, 4, 9, 'Delivered', '2025-12-23 12:45:00', '2025-12-23 13:45:00'),
(5, 5, 10, 'On the Way', '2025-09-15 10:15:00', NULL),
(6, 6, 6, 'On the Way', '2025-10-18 12:37:00', NULL),
(7, 7, 8, 'Delivered', '2025-04-03 09:55:00', '2025-04-03 10:55:00'),
(8, 8, 10, 'Delivered', '2025-05-22 16:13:00', '2025-05-22 17:13:00'),
(9, 9, 9, 'Delivered', '2025-08-08 21:30:00', '2025-08-08 22:30:00'),
(10, 10, 7, 'Delivered', '2025-02-22 15:22:00', '2025-02-22 16:22:00'),
(11, 11, 3, 'Picked Up', '2025-11-21 19:06:00', NULL),
(12, 12, 8, 'Delivered', '2025-04-07 12:34:00', '2025-04-07 13:34:00'),
(13, 13, 8, 'Failed', '2025-05-15 12:55:00', NULL),
(14, 14, 5, 'Delivered', '2025-02-02 19:34:00', '2025-02-02 20:34:00'),
(15, 15, 4, 'On the Way', '2025-03-14 16:30:00', NULL),
(16, 16, 5, 'Delivered', '2025-03-13 09:24:00', '2025-03-13 10:24:00'),
(17, 17, 9, 'Delivered', '2025-07-23 20:50:00', '2025-07-23 21:50:00'),
(18, 18, 8, 'Delivered', '2025-04-10 12:03:00', '2025-04-10 13:03:00'),
(19, 19, 4, 'Delivered', '2025-12-11 09:03:00', '2025-12-11 10:03:00'),
(20, 20, 5, 'Delivered', '2025-03-02 17:05:00', '2025-03-02 18:05:00'),
(21, 21, 8, 'Delivered', '2025-02-22 22:15:00', '2025-02-22 23:15:00'),
(22, 22, 5, 'Assigned', '2025-10-20 09:39:00', NULL),
(23, 23, 4, 'Delivered', '2025-09-11 13:13:00', '2025-09-11 14:13:00'),
(24, 24, 5, 'Delivered', '2025-05-13 11:42:00', '2025-05-13 12:42:00'),
(25, 25, 6, 'Failed', '2025-02-01 16:39:00', NULL),
(26, 26, 9, 'Picked Up', '2025-09-07 17:16:00', NULL),
(27, 27, 2, 'Delivered', '2025-04-12 13:10:00', '2025-04-12 14:10:00'),
(28, 28, 3, 'Assigned', '2025-10-26 19:33:00', NULL),
(29, 29, 7, 'Assigned', '2025-11-04 11:16:00', NULL),
(30, 30, 3, 'On the Way', '2025-03-09 13:38:00', NULL);
