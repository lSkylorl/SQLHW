CREATE DATABASE IF NOT EXISTS Homework1;
USE Homework1;

DROP TABLE IF EXISTS cellphone;
CREATE TABLE cellphone
(
    id INT PRIMARY KEY AUTO_INCREMENT,
	ProductName VARCHAR(20),
    Manufacturer VARCHAR(20),
    ProductCount INT NOT NULL,
	Price INT NOT NULL
);

INSERT cellphone (ProductName, Manufacturer, ProductCount, Price)
VALUES
	("iPhone X", "Apple", "3", "76000"),
	("iPhone 8", "Apple", "2", "51000"),
    ("Galaxy S9", "Samsung", "2", "56000"),
	("Galaxy S8", "Samsung", "1", "41000"),
    ("P60 Pro", "Huawei", "8", "62000"),
    ("P20 Pro", "Huawei", "5", "36000");
    
SELECT ProductName, Manufacturer, Price
FROM cellphone
Where ProductCount > 1;

SELECT ProductName, Manufacturer, ProductCount, Price
FROM cellphone
Where Manufacturer = "Samsung";

SELECT ProductName, Manufacturer, ProductCount, Price
FROM cellphone
Where ProductCount * Price > 100000 AND ProductCount * Price < 145000;