CREATE DATABASE IF NOT EXISTS homework5;
USE homework5;

DROP TABLE IF EXISTS cars;
CREATE TABLE cars (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(55),
    cost INT);

INSERT INTO cars (id, name, cost) VALUES (1, 'Audi', 52642);
INSERT INTO cars (id, name, cost) VALUES (2, 'Mercedes', 57127);
INSERT INTO cars (id, name, cost) VALUES (3, 'Skoda', 9000);
INSERT INTO cars (id, name, cost) VALUES (4, 'Volvo', 29000);
INSERT INTO cars (id, name, cost) VALUES (5, 'Bentley', 35000);
INSERT INTO cars (id, name, cost) VALUES (6, 'Citroen', 21000);
INSERT INTO cars (id, name, cost) VALUES (7, 'Hummer', 41400);
INSERT INTO cars (id, name, cost) VALUES (8, 'Volkswagen', 21600);

SELECT * FROM cars;
    
-- Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов

CREATE VIEW cheapCars AS
SELECT *
FROM cars
WHERE cost < 25000;

SELECT * FROM cheapCars;

-- Изменить в существующем представлении порог для стоимости: 
-- пусть цена будет до 30 000 долларов

ALTER VIEW cheapCars AS
SELECT *
FROM cars
WHERE cost < 30000;

SELECT * FROM cheapCars;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

CREATE VIEW skodaAudi AS
SELECT *
FROM cars
WHERE name IN ('Skoda', 'Audi');

SELECT * FROM skodaAudi;