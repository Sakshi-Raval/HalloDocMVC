--Assignment 2
FROM customer c
LEFT OUTER JOIN orders_1 o
ON c.customer_id=o.customer_id
LEFT OUTER JOIN salesman s
ON c.salesman_id=s.salesman_id;