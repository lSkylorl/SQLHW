USE Homework2; 
DROP TABLE IF EXISTS orders; 

CREATE TABLE IF NOT EXISTS orders 
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(20),
	amount FLOAT,
	order_status VARCHAR(10)
);

INSERT INTO orders (employee_id, amount, order_status)
VALUE 
	('e03', 15.00, 'OPEN'),
	('e01', 25.50, 'OPEN'),
	('e03', 100.70, 'CLOSED'),
	('e05', 22.18, 'OPEN'),
	('e04', 9.50, 'CANCELLED');
	
SELECT id, employee_id, amount, order_status,
CASE
	WHEN order_status = 'OPEN'
		THEN 'order is in open state'
	WHEN order_status = 'CLOSED'
		THEN 'order is closed'
	WHEN order_status = 'CANCELLED'
		THEN 'order is cancelled'
END AS full_order_status
FROM orders;