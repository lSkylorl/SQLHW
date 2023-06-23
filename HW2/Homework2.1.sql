CREATE DATABASE IF NOT EXISTS Homework2; 
USE Homework2; 

DROP TABLE IF EXISTS sales; 
CREATE TABLE IF NOT EXISTS sales 
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	order_data DATE,
	count_product INT
);

INSERT INTO sales (order_data, count_product)
VALUE 
	("2022-06-01", 450),
	("2022-05-02", 50),
	("2022-04-03", 90),
	("2022-03-04", 200),
	("2022-02-05", 250),
	("2022-01-06", 305);
    
SELECT id,
CASE
	WHEN count_product > 300
		THEN "Большой заказ"
	WHEN count_product < 100
		THEN "Маленький заказ"
	ELSE "Средний заказ"
END AS result
FROM sales;