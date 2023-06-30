/*
Добавьте новый столбец под названием "время до следующей станции". 
Чтобы получить это значение, мы вычитаем время станций для пар смежных станций. 
Мы можем вычислить это значение без использования оконной функции SQL, 
но это может быть очень сложно. Проще это сделать с помощью оконной функции LEAD . 
Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить 
результат. В этом случае функция сравнивает значения в столбце «время» для станции со 
станцией сразу после нее.
*/

CREATE DATABASE IF NOT EXISTS homework5;
USE homework5;

DROP TABLE IF EXISTS stations;
CREATE TABLE stations
(
train_id INT NOT NULL,
station varchar(20) NOT NULL,
station_time TIME NOT NULL
);
INSERT stations(train_id, station, station_time)
VALUES (110, "San Francisco", "10:00:00"),
(110, "Redwood Sity", "10:54:00"),
(110, "Palo Alto", "11:02:00"),
(110, "San Jose", "12:35:00"),
(120, "San Francisco", "11:00:00"),
(120, "Palo Alto", "12:49:00"),
(120, "San Jose", "13:30:00");

SELECT * FROM stations;

ALTER TABLE stations
ADD COLUMN time_to_next_station TIME;

UPDATE stations s
JOIN (
    SELECT train_id, station, station_time, 
	LEAD(station_time) OVER (PARTITION BY train_id ORDER BY station_time) 
    AS next_station_time
    FROM stations) t 
    ON s.train_id = t.train_id AND s.station = t.station 
    AND s.station_time = t.station_time
	SET s.time_to_next_station = TIMEDIFF(t.next_station_time, s.station_time);

SELECT * FROM stations;