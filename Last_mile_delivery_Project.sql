CREATE DATABASE last_mile;

USE last_mile;

CREATE TABLE customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    delivery_zone_id VARCHAR(20) NOT NULL,
    preferred_time_slot VARCHAR(50) NOT NULL,
    customer_type VARCHAR(20) NOT NULL,
    account_since DATE NOT NULL
);

CREATE TABLE drivers (
    driver_id VARCHAR(20) PRIMARY KEY,
    driver_name VARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL,
    rating DECIMAL(3,2),
    employment_type VARCHAR(30) NOT NULL,
    is_active VARCHAR(10) NOT NULL
);

CREATE TABLE vehicles (
    vehicle_id VARCHAR(20) PRIMARY KEY,
    vehicle_type VARCHAR(50) NOT NULL,
    fuel_type VARCHAR(30) NOT NULL,
    max_payload_kg DECIMAL(10,2) NOT NULL,
    depot VARCHAR(20) NOT NULL,
    last_service_date DATE NOT NULL,
    is_active VARCHAR(10) NOT NULL
);

CREATE TABLE orders (
    order_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20) NOT NULL,
    order_date DATE NOT NULL,
    delivery_zone_id VARCHAR(20) NOT NULL,
    package_weight_kg DECIMAL(10,2) NOT NULL,
    service_type VARCHAR(30) NOT NULL,
    priority VARCHAR(20) NOT NULL,
    total_value DECIMAL(12,2) NOT NULL,

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

CREATE TABLE deliveries (
    delivery_id VARCHAR(20) PRIMARY KEY,
    order_id VARCHAR(20) NOT NULL,
    driver_id VARCHAR(20) NOT NULL,
    vehicle_id VARCHAR(20) NOT NULL,
    assigned_date DATE NOT NULL,
    actual_delivery_date DATE,
    status VARCHAR(20) NOT NULL,
    delivery_attempt INT NOT NULL,
    distance_km DECIMAL(10,2) NOT NULL,
    delivery_duration_min INT NOT NULL,

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (driver_id)
        REFERENCES drivers(driver_id),

    FOREIGN KEY (vehicle_id)
        REFERENCES vehicles(vehicle_id)
);

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM deliveries;
SELECT COUNT(*) FROM drivers;
SELECT COUNT(*) FROM vehicles;

SELECT
    SUM(customer_id IS NULL) AS customer_id_nulls,
    SUM(customer_name IS NULL) AS customer_name_nulls,
    SUM(city IS NULL) AS city_nulls,
    SUM(delivery_zone_id IS NULL) AS delivery_zone_id_nulls,
    SUM(preferred_time_slot IS NULL) AS preferred_time_slot_nulls,
    SUM(customer_type IS NULL) AS customer_type_nulls,
    SUM(account_since IS NULL) AS account_since_nulls
FROM customers;

SELECT customer_id, COUNT(*) AS count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

SELECT
    SUM(order_id IS NULL) AS order_id_nulls,
    SUM(customer_id IS NULL) AS customer_id_nulls,
    SUM(order_date IS NULL) AS order_date_nulls,
    SUM(delivery_zone_id IS NULL) AS delivery_zone_id_nulls,
    SUM(package_weight_kg IS NULL) AS package_weight_nulls,
    SUM(service_type IS NULL) AS service_type_nulls,
    SUM(priority IS NULL) AS priority_nulls,
    SUM(total_value IS NULL) AS total_value_nulls
FROM orders;

SELECT order_id, COUNT(*) AS count
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

SELECT
    SUM(delivery_id IS NULL) AS delivery_id_nulls,
    SUM(order_id IS NULL) AS order_id_nulls,
    SUM(driver_id IS NULL) AS driver_id_nulls,
    SUM(vehicle_id IS NULL) AS vehicle_id_nulls,
    SUM(assigned_date IS NULL) AS assigned_date_nulls,
    SUM(actual_delivery_date IS NULL) AS actual_delivery_date_nulls,
    SUM(status IS NULL) AS status_nulls,
    SUM(delivery_attempt IS NULL) AS delivery_attempt_nulls,
    SUM(distance_km IS NULL) AS distance_nulls,
    SUM(delivery_duration_min IS NULL) AS duration_nulls
FROM deliveries;

SELECT delivery_id, COUNT(*) AS count
FROM deliveries
GROUP BY delivery_id
HAVING COUNT(*) > 1;

SELECT
    SUM(driver_id IS NULL) AS driver_id_nulls,
    SUM(driver_name IS NULL) AS driver_name_nulls,
    SUM(hire_date IS NULL) AS hire_date_nulls,
    SUM(rating IS NULL) AS rating_nulls,
    SUM(employment_type IS NULL) AS employment_type_nulls,
    SUM(is_active IS NULL) AS is_active_nulls
FROM drivers;

SELECT driver_id, COUNT(*) AS count
FROM drivers
GROUP BY driver_id
HAVING COUNT(*) > 1;

SELECT
    SUM(vehicle_id IS NULL) AS vehicle_id_nulls,
    SUM(vehicle_type IS NULL) AS vehicle_type_nulls,
    SUM(fuel_type IS NULL) AS fuel_type_nulls,
    SUM(max_payload_kg IS NULL) AS max_payload_nulls,
    SUM(depot IS NULL) AS depot_nulls,
    SUM(last_service_date IS NULL) AS service_date_nulls,
    SUM(is_active IS NULL) AS is_active_nulls
FROM vehicles;

SELECT vehicle_id, COUNT(*) AS count
FROM vehicles
GROUP BY vehicle_id
HAVING COUNT(*) > 1;

SELECT * FROM customers LIMIT 10;
SELECT * FROM orders LIMIT 10;
SELECT * FROM orders LIMIT 10;
SELECT * FROM drivers LIMIT 10;
SELECT * FROM vehicles LIMIT 10;


SELECT 'customers' AS table_name, COUNT(*) AS total_rows
FROM customers

UNION ALL

SELECT 'orders', COUNT(*)
FROM orders

UNION ALL

SELECT 'deliveries', COUNT(*)
FROM deliveries

UNION ALL

SELECT 'drivers', COUNT(*)
FROM drivers

UNION ALL

SELECT 'vehicles', COUNT(*)
FROM vehicles;


USE quickroute_logistics;


-- =========================================================
-- SPRINT 3: BASIC ANALYSIS / DATA EXPLORATION
-- =========================================================


-- 1. What is the total number of customers?
SELECT COUNT(*) AS total_customers
FROM customers;


-- 2. What is the total number of orders?
SELECT COUNT(*) AS total_orders
FROM orders;


-- 3. What is the total number of deliveries?
SELECT COUNT(*) AS total_deliveries
FROM deliveries;


-- 4. What are the different service types available?
SELECT DISTINCT service_type
FROM orders;


-- 5. How many drivers are currently active?
SELECT COUNT(*) AS active_drivers
FROM drivers
WHERE is_active = 'Yes';


-- 6. What are the different vehicle types?
SELECT DISTINCT vehicle_type
FROM vehicles;


-- 7. What is the total order value?
SELECT SUM(total_value) AS total_order_value
FROM orders;


-- 8. What is the average package weight?
SELECT AVG(package_weight_kg) AS average_package_weight
FROM orders;



-- =========================================================
-- SPRINT 4.1: UNDERSTAND DELIVERY DEMAND
-- =========================================================


-- 9. Which delivery zones have the highest number of orders?
SELECT delivery_zone_id,
       COUNT(*) AS total_orders
FROM orders
GROUP BY delivery_zone_id
ORDER BY total_orders DESC;


-- 10. Which service types have the highest demand?
SELECT service_type,
       COUNT(*) AS total_orders
FROM orders
GROUP BY service_type
ORDER BY total_orders DESC;


-- 11. Which priority level has the highest number of orders?
SELECT priority,
       COUNT(*) AS total_orders
FROM orders
GROUP BY priority
ORDER BY total_orders DESC;


-- 12. How does order volume change over time?
SELECT YEAR(order_date) AS order_year,
       MONTH(order_date) AS order_month,
       COUNT(*) AS total_orders
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY order_year, order_month;


-- 13. Which service type generates the highest order value?
SELECT service_type,
       COUNT(*) AS total_orders,
       SUM(total_value) AS total_order_value,
       AVG(total_value) AS average_order_value
FROM orders
GROUP BY service_type
ORDER BY total_order_value DESC;



-- =========================================================
-- SPRINT 4.2: UNDERSTAND CUSTOMER ORDER BEHAVIOUR
-- =========================================================


-- 14. Which customers place the most orders?
SELECT customer_id,
       COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC;


-- 15. Which customers have the highest total order value?
SELECT customer_id,
       SUM(total_value) AS total_order_value
FROM orders
GROUP BY customer_id
ORDER BY total_order_value DESC;


-- 16. Which customer type generates more orders and value?
SELECT c.customer_type,
       COUNT(o.order_id) AS total_orders,
       SUM(o.total_value) AS total_order_value,
       AVG(o.total_value) AS average_order_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_type
ORDER BY total_order_value DESC;


-- 17. How does customer activity vary across delivery zones?
SELECT c.delivery_zone_id,
       COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.delivery_zone_id
ORDER BY total_orders DESC;


-- 18. How does customer ordering change over time?
SELECT YEAR(order_date) AS order_year,
       MONTH(order_date) AS order_month,
       COUNT(*) AS total_orders
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY order_year, order_month;



-- =========================================================
-- SPRINT 4.3: EVALUATE DELIVERY PERFORMANCE
-- =========================================================


-- 19. What is the distribution of delivery statuses?
SELECT status,
       COUNT(*) AS total_deliveries
FROM deliveries
GROUP BY status
ORDER BY total_deliveries DESC;


-- 20. How does delivery performance vary by zone?
SELECT o.delivery_zone_id,
       d.status,
       COUNT(*) AS total_deliveries
FROM orders o
JOIN deliveries d
    ON o.order_id = d.order_id
GROUP BY o.delivery_zone_id, d.status
ORDER BY o.delivery_zone_id, total_deliveries DESC;


-- 21. What is the average delivery duration?
SELECT AVG(delivery_duration_min) AS average_delivery_duration
FROM deliveries;


-- 22. What is the average delivery distance?
SELECT AVG(distance_km) AS average_delivery_distance
FROM deliveries;


-- 23. Which service types have longer delivery durations?
SELECT o.service_type,
       AVG(d.delivery_duration_min) AS average_delivery_duration
FROM orders o
JOIN deliveries d
    ON o.order_id = d.order_id
GROUP BY o.service_type
ORDER BY average_delivery_duration DESC;


-- 24. How does delivery performance change over time?
SELECT YEAR(assigned_date) AS delivery_year,
       MONTH(assigned_date) AS delivery_month,
       COUNT(*) AS total_deliveries,
       AVG(delivery_duration_min) AS average_duration
FROM deliveries
GROUP BY YEAR(assigned_date), MONTH(assigned_date)
ORDER BY delivery_year, delivery_month;



-- =========================================================
-- SPRINT 4.4: DRIVER AND VEHICLE PERFORMANCE
-- =========================================================


-- 25. Which drivers handle the most deliveries?
SELECT dr.driver_id,
       dr.driver_name,
       COUNT(d.delivery_id) AS total_deliveries
FROM drivers dr
JOIN deliveries d
    ON dr.driver_id = d.driver_id
GROUP BY dr.driver_id, dr.driver_name
ORDER BY total_deliveries DESC;


-- 26. How do delivery outcomes vary by driver?
SELECT dr.driver_name,
       d.status,
       COUNT(*) AS total_deliveries
FROM drivers dr
JOIN deliveries d
    ON dr.driver_id = d.driver_id
GROUP BY dr.driver_name, d.status
ORDER BY dr.driver_name, total_deliveries DESC;


-- 27. What is the average delivery duration for each driver?
SELECT dr.driver_name,
       AVG(d.delivery_duration_min) AS average_duration
FROM drivers dr
JOIN deliveries d
    ON dr.driver_id = d.driver_id
GROUP BY dr.driver_name
ORDER BY average_duration DESC;


-- 28. Which vehicle types are used the most?
SELECT v.vehicle_type,
       COUNT(d.delivery_id) AS total_deliveries
FROM vehicles v
JOIN deliveries d
    ON v.vehicle_id = d.vehicle_id
GROUP BY v.vehicle_type
ORDER BY total_deliveries DESC;


-- 29. How does vehicle performance differ by vehicle type?
SELECT v.vehicle_type,
       COUNT(d.delivery_id) AS total_deliveries,
       AVG(d.delivery_duration_min) AS average_duration,
       AVG(d.distance_km) AS average_distance
FROM vehicles v
JOIN deliveries d
    ON v.vehicle_id = d.vehicle_id
GROUP BY v.vehicle_type
ORDER BY total_deliveries DESC;



-- =========================================================
-- SPRINT 4.5: IDENTIFY DELIVERY PROBLEMS
-- =========================================================


-- 30. Which orders required multiple delivery attempts?
SELECT order_id,
       COUNT(*) AS total_attempts
FROM deliveries
GROUP BY order_id
HAVING COUNT(*) > 1
ORDER BY total_attempts DESC;


-- 31. Which deliveries have more than one attempt?
SELECT *
FROM deliveries
WHERE delivery_attempt > 1
ORDER BY delivery_attempt DESC;


-- 32. What are the common delivery statuses and problem patterns?
SELECT status,
       COUNT(*) AS total_deliveries,
       AVG(delivery_attempt) AS average_attempts
FROM deliveries
GROUP BY status
ORDER BY total_deliveries DESC;


-- 33. How does performance differ for orders with multiple attempts?
SELECT
    CASE
        WHEN delivery_attempt > 1 THEN 'Multiple Attempts'
        ELSE 'Single Attempt'
    END AS attempt_group,
    COUNT(*) AS total_deliveries,
    AVG(delivery_duration_min) AS average_duration
FROM deliveries
GROUP BY attempt_group;


-- 34. Which zones experience more delivery problems?
SELECT
    o.delivery_zone_id,
    COUNT(*) AS total_deliveries,
    SUM(
        CASE
            WHEN d.status IN ('Failed', 'Rescheduled')
            THEN 1
            ELSE 0
        END
    ) AS problem_deliveries
FROM orders o
JOIN deliveries d
    ON o.order_id = d.order_id
GROUP BY o.delivery_zone_id
ORDER BY problem_deliveries DESC;