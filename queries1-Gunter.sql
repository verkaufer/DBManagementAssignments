/**
* SQL Queries 1 - Database Management
* Due: 16 September 2013
* Submitted by: David Gunter
*/

/* 1. List all data for all customers */
SELECT * FROM customers;

/* 2. List name and city of agents named Smith */
SELECT name, city FROM agents WHERE name = 'Smith';

/* 3. List pid, name, and quantity of products costing more than US $1.25 */
SELECT pid, name, quantity FROM products WHERE priceusd > 1.25;

/* 4. List the ordno and aid of all orders */
SELECT ordno, aid FROM orders;

/* 5. List the names and cities of customers not in Dallas */
SELECT name, city FROM customers WHERE city != 'Dallas';

/* 6. List the names of agents in New York or Newark */
SELECT name FROM agents WHERE (city = 'New York' OR city = 'Newark');

/* 7. List all data for products not in New York or Newark that cost US $1 or less */
SELECT * FROM products WHERE (city != 'New York' AND city != 'Newark') AND priceusd <= 1.00;

/* 8. List all data for orders in January or March */
SELECT * FROM orders WHERE (mon = 'jan' OR mon = 'mar');

/* 9. List all data for orders in February less than US$100 */
SELECT * FROM orders WHERE mon = 'feb' AND dollars < 100.00;

/* 10. List all orders from customers whose cid is C005 */
SELECT * FROM orders WHERE cid = 'C005';