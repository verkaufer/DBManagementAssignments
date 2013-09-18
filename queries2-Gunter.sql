/*
* Homework Assignment #2
* Database Management Systems
* David Gunter 
*/ 

-- 1. Get the cities of agents booking an order for customer c002.
	SELECT city 
	FROM agents 
	WHERE aid IN (
		SELECT aid
		FROM orders
		WHERE cid = 'c002'
	);

-- 2. Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto.
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


-- 3. Find the cids and names of customers who never placed an order through agent a03.
	SELECT cid, name
	FROM customers
	WHERE cid IN (
	  SELECT cid
	  FROM orders
	  WHERE cid NOT IN (
	    SELECT cid 
	    FROM orders
	    WHERE aid = 'a03'
	  ) 
	) OR cid NOT IN (
	    SELECT cid FROM orders
	);



-- 4. Get the cids and names of customers who ordered both product p01 and p07. 
	SELECT cid, name
	FROM customers
	WHERE cid IN (
	  select distinct(cid)
	  from orders
	  where pid in ('p01','p07')
	  group by cid,pid
	  having count(*) =1  
	);


--!!NEED TO FIX THIS ONE!!--
-- 5. Get the pids of of products ordered by any customers who ever placed and order through  
--    agent a03.
	SELECT DISTINCT(pid) 
	FROM orders
	WHERE pid IN (
		SELECT pid FROM orders WHERE aid = 'a03'
	)
	ORDER BY pid;


-- 6. Get the names and discounts of all customers who place orders through agents in either Dallas or Duluth.
	SELECT name, discount
	FROM customers
	WHERE cid IN (
	  SELECT cid 
	  FROM orders
	  WHERE aid IN (
	    SELECT aid 
	    FROM agents
	    WHERE city = 'Dallas' or city = 'Duluth'
	  )
	);

-- 7. Find all customers who have the same discount as that of any customers in Dallas or Kyoto.
	SELECT *
	FROM customers c
	WHERE EXISTS (
	  SELECT * FROM customers c2
	  WHERE city = 'dallas' OR city = 'tokyo'
	  AND c2.discount = c.discount
	)


-- 8. Get the ids of customers who did not place any orders through agent a03.
-- Is this supposed to be identical to #3?
		SELECT cid
		FROM customers
		WHERE cid IN (
		  SELECT cid
		  FROM orders
		  WHERE cid NOT IN (
		    SELECT cid 
		    FROM orders
		    WHERE aid = 'a03'
		  ) 
		) OR cid NOT IN (
		    SELECT cid FROM orders
		);