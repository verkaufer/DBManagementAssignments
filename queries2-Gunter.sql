/*
* Homework Assignment #2
* Database Management Systems
* David Gunter - submitted via Git
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
	) 
	OR cid NOT IN (
	    SELECT cid FROM orders
	);



-- 4. Get the cids and names of customers who ordered both product p01 and p07. 
	SELECT cid, name
	FROM customers
	WHERE cid IN (
		SELECT cid 
		FROM orders
		WHERE pid IN ('p01','p07')
		GROUP BY cid
		HAVING COUNT(cid) > 1
	);


-- 5. Get the pids of of products ordered by any customers who ever placed an order through  
--    agent a03.
	SELECT pid
	FROM orders
	WHERE pid IN (
		SELECT pid
		FROM orders
		WHERE cid IN(
			SELECT cid
			FROM orders
			WHERE aid = 'a03'
		)
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
	        WHERE city = 'Dallas' 
	        OR    city = 'Duluth'
	  )
	);

-- 7. Find all customers who have the same discount as that of any customers in Dallas or Kyoto.
	SELECT name
	FROM customers
	WHERE discount IN (
	      SELECT distinct(discount)
		  FROM customers
	      WHERE city = 'Dallas' 
	      OR city = 'Kyoto'
	    );

        
		-- GOTTA HUSTLE
        --                       .(_)_
        --                      /,    \                 .
        --                     <_)    |\
        --                    __/._ .-|/_         `     .     '
        --                     (   .   )             .  |  .
        --                     : .d8b-'/       _      \.-./      _
        -- a:f.-.-..-.--.--._  ( ( Y `n   ____________'...`__________
        -- '/    '-.  . -      : : # .v       .    ----==-----    .
        --    .'-.   ' .-,_.-' ( )_#_/  `-._.   -     ---     --
        --           ._.-'      O/ #        `/:_      ---  -
        --   '.,   .-'          "' #          ` `=. .  -
        --     _.-'                #               `-:
        --                         .
        --                         `:
        --                          '