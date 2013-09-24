/**
* Queries Assignment #3
* Due October 7th, 2013
* David Gunter
*/

-- 1

	SELECT city 
	FROM agents 
	WHERE aid IN (
		SELECT aid
		FROM orders
		WHERE cid = 'c002'
	);

-- 2

	SELECT city 
	FROM agents
	JOIN orders
		ON agents.aid = orders.aid
	WHERE cid = 'c002';

-- 3
	SELECT pid 
	FROM products
	WHERE pid IN ( 
	     SELECT pid 
	     FROM orders
	     WHERE cid IN(
	    		SELECT cid
	       		FROM customers
	       		WHERE city = 'Kyoto'
	   )
	);

-- 4

	SELECT distinct(p.pid)
	FROM products p
	JOIN orders o
		ON p.pid = o.pid
	JOIN customers c
		ON c.cid = o.cid 
		WHERE c.city = 'Kyoto';

-- 5 

	SELECT cid, name
	FROM customers
	WHERE cid NOT IN (
	        SELECT cid
	        FROM orders
		);

--6 

	SELECT customers.cid, customers.name
	FROM customers
	LEFT OUTER JOIN orders 
		ON (customers.cid = orders.cid)
	WHERE orders.cid IS NULL;

-------
-- 7 --
-------

	SELECT customers.name, agents.name
	FROM customers
	JOIN agents ON 
		customers.city = agents.city
	WHERE agents.aid IN (
	      select aid FROM orders
	      );

-------
-- 8 --
-------

	SELECT customers.name, agents.name, customers.city
	FROM customers
	JOIN agents ON 
		customers.city = agents.city;

-------
-- 9 --
-------