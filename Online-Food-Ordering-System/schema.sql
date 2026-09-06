-- ============================================================
-- Online Food Ordering System
-- File: schema.sql
-- Description: Database Definition Language (DDL) script.
-- Creates the database and all tables with primary keys,
-- foreign keys, and integrity constraints (up to 3NF).
-- Target RDBMS: MySQL 8.0+
-- ============================================================

DROP DATABASE IF EXISTS online_food_ordering_system;
CREATE DATABASE online_food_ordering_system;
USE online_food_ordering_system;

-- ------------------------------------------------------------
-- Table: Customer
-- Stores registered customers who place orders.
-- ------------------------------------------------------------
CREATE TABLE Customer (
    customer_id       INT AUTO_INCREMENT PRIMARY KEY,
    full_name         VARCHAR(100)        NOT NULL,
    email             VARCHAR(100)        NOT NULL UNIQUE,
    phone             VARCHAR(15)         NOT NULL UNIQUE,
    address           VARCHAR(255)        NOT NULL,
    city              VARCHAR(50)         NOT NULL,
    registration_date DATE                NOT NULL DEFAULT (CURRENT_DATE),
    CONSTRAINT chk_customer_phone CHECK (CHAR_LENGTH(phone) >= 10)
);

-- ------------------------------------------------------------
-- Table: Restaurant
-- Stores partner restaurants listed on the platform.
-- ------------------------------------------------------------
CREATE TABLE Restaurant (
    restaurant_id     INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_name   VARCHAR(100)        NOT NULL,
    cuisine_type      VARCHAR(50)         NOT NULL,
    address           VARCHAR(255)        NOT NULL,
    city              VARCHAR(50)         NOT NULL,
    contact_number    VARCHAR(15)         NOT NULL UNIQUE,
    rating            DECIMAL(2,1)        NOT NULL DEFAULT 0.0,
    CONSTRAINT chk_restaurant_rating CHECK (rating >= 0.0 AND rating <= 5.0)
);

-- ------------------------------------------------------------
-- Table: MenuItem
-- Stores menu items offered by each restaurant.
-- A MenuItem always belongs to exactly one Restaurant (1:N).
-- ------------------------------------------------------------
CREATE TABLE MenuItem (
    item_id           INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id     INT                 NOT NULL,
    item_name         VARCHAR(100)        NOT NULL,
    category          VARCHAR(50)         NOT NULL,
    price             DECIMAL(8,2)        NOT NULL,
    is_available       BOOLEAN             NOT NULL DEFAULT TRUE,
    CONSTRAINT fk_menuitem_restaurant
        FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_menuitem_price CHECK (price > 0)
);

-- ------------------------------------------------------------
-- Table: Orders
-- Stores an order header placed by a Customer at a Restaurant.
-- (Named "Orders" because ORDER is a reserved SQL keyword.)
-- ------------------------------------------------------------
CREATE TABLE Orders (
    order_id          INT AUTO_INCREMENT PRIMARY KEY,
    customer_id       INT                 NOT NULL,
    restaurant_id     INT                 NOT NULL,
    order_date        DATETIME            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    order_status      ENUM('Placed','Confirmed','Preparing','Out for Delivery',
                            'Delivered','Cancelled') NOT NULL DEFAULT 'Placed',
    total_amount      DECIMAL(10,2)       NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_orders_restaurant
        FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_orders_total CHECK (total_amount >= 0)
);

-- ------------------------------------------------------------
-- Table: OrderItem
-- Junction/associative entity resolving the M:N relationship
-- between Orders and MenuItem (line items of an order).
-- ------------------------------------------------------------
CREATE TABLE OrderItem (
    order_item_id     INT AUTO_INCREMENT PRIMARY KEY,
    order_id          INT                 NOT NULL,
    item_id           INT                 NOT NULL,
    quantity          INT                 NOT NULL,
    unit_price        DECIMAL(8,2)        NOT NULL,
    subtotal          DECIMAL(10,2)       GENERATED ALWAYS AS (quantity * unit_price) STORED,
    CONSTRAINT fk_orderitem_order
        FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_orderitem_menuitem
        FOREIGN KEY (item_id) REFERENCES MenuItem(item_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_orderitem_qty CHECK (quantity > 0),
    CONSTRAINT uq_order_item UNIQUE (order_id, item_id)
);

-- ------------------------------------------------------------
-- Table: Payment
-- Stores payment details for an order. 1:1 with Orders.
-- ------------------------------------------------------------
CREATE TABLE Payment (
    payment_id        INT AUTO_INCREMENT PRIMARY KEY,
    order_id          INT                 NOT NULL UNIQUE,
    payment_method    ENUM('UPI','Credit Card','Debit Card','Net Banking','Cash on Delivery')
                                          NOT NULL,
    payment_status    ENUM('Pending','Success','Failed','Refunded') NOT NULL DEFAULT 'Pending',
    payment_date      DATETIME            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    amount            DECIMAL(10,2)       NOT NULL,
    CONSTRAINT fk_payment_order
        FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_payment_amount CHECK (amount >= 0)
);

-- ------------------------------------------------------------
-- Table: DeliveryAgent
-- Stores delivery personnel who fulfil deliveries.
-- ------------------------------------------------------------
CREATE TABLE DeliveryAgent (
    agent_id          INT AUTO_INCREMENT PRIMARY KEY,
    full_name         VARCHAR(100)        NOT NULL,
    phone             VARCHAR(15)         NOT NULL UNIQUE,
    vehicle_type      ENUM('Bike','Scooter','Bicycle','Car') NOT NULL,
    city              VARCHAR(50)         NOT NULL
);

-- ------------------------------------------------------------
-- Table: Delivery
-- Stores delivery execution details for an order. 1:1 with Orders,
-- and an agent may perform many deliveries (1:N from DeliveryAgent).
-- ------------------------------------------------------------
CREATE TABLE Delivery (
    delivery_id       INT AUTO_INCREMENT PRIMARY KEY,
    order_id          INT                 NOT NULL UNIQUE,
    agent_id          INT                 NOT NULL,
    delivery_status   ENUM('Assigned','Picked Up','On the Way','Delivered','Failed')
                                          NOT NULL DEFAULT 'Assigned',
    assigned_time     DATETIME            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    delivered_time    DATETIME            NULL,
    CONSTRAINT fk_delivery_order
        FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_delivery_agent
        FOREIGN KEY (agent_id) REFERENCES DeliveryAgent(agent_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_delivery_times CHECK (delivered_time IS NULL OR delivered_time >= assigned_time)
);

-- ------------------------------------------------------------
-- Helpful indexes for common lookups / join performance
-- ------------------------------------------------------------
CREATE INDEX idx_menuitem_restaurant   ON MenuItem(restaurant_id);
CREATE INDEX idx_orders_customer       ON Orders(customer_id);
CREATE INDEX idx_orders_restaurant     ON Orders(restaurant_id);
CREATE INDEX idx_orderitem_order       ON OrderItem(order_id);
CREATE INDEX idx_orderitem_item        ON OrderItem(item_id);
CREATE INDEX idx_delivery_agent        ON Delivery(agent_id);
