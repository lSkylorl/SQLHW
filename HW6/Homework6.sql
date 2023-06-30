-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

CREATE DATABASE IF NOT EXISTS homework6;
USE homework6;

DROP TABLE IF EXISTS time;
CREATE TABLE time (
	time_id INT PRIMARY KEY AUTO_INCREMENT, 
	seconds INT
);

INSERT INTO time (seconds) 
VALUES 
	(123456),
	(603894),
	(985234);

DELIMITER |
CREATE FUNCTION format_time (
val INT
)
RETURNS char(45)
DETERMINISTIC
BEGIN
	DECLARE DD char(3);
	DECLARE HH, MI, SS char(2);
	DECLARE result char(50);
	set DD = cast(floor(val/60/60/24) as char(3));
	set HH = cast(floor(mod(val/60/60/24,1)*24) as char(2));
	set MI = cast(floor(mod(mod(val/60/60/24,1)*24,1)*60) as char(2));
	set SS = cast(round(mod(mod(mod(val/60/60/24,1)*24,1)*60,1)*60) as char(2));
  set result = concat(DD,' day(s) ',HH,' hour(s) ',MI,' minute(s) ',SS,' second(s) ');
return result;
END |

SElECT format_time(seconds) AS result from time; 

-- Выведите только четные числа от 1 до 10 (Через цикл). Пример: 2,4,6,8,10

DROP FUNCTION IF EXISTS inpEvenNum;
DELIMITER $$ 
CREATE FUNCTION inpEvenNum (num INT) 

RETURNS VARCHAR(256) 
DETERMINISTIC 
BEGIN 
DECLARE i INT DEFAULT 0; 
DECLARE result VARCHAR(256); 
set result=''; 
WHILE i < num DO 
SET i = i + 2; 
SET result = concat(result, '  ', i); 
END while; 
RETURN result; 
END $$ 
DELIMITER ; 

SELECT inpEvenNum(10);