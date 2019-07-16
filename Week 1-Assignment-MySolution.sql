-- MSDS Summer Bridge 2019
-- Week 1 Assignment: SQL SELECT and Aggregations
-- Aysmel Aguasvivas Velazquez
-- July 15, 2019

-- 1. Which destination in the flights database is the furthest distance away, based on information in the flights table. Show the SQL query(s) that support your conclusion.
-- Result: The flight from JFK to HNL is the furthest distance away.
SELECT *
FROM flights
ORDER BY distance DESC
LIMIT 1;

-- 2. What are the different numbers of engines in the planes table? For each number of engines, which aircraft have the most number of seats? Show the SQL statement(s) that support your result.
-- Result: Planes have between 1 and 4 engines.
-- The aircraft with 1 engine with the most seats is N567AA.
-- The aircraft with 2 engine with the most seats is N206UA.
-- The aircraft with 3 engine with the most seats are N854NW.
-- The aircraft with 4 engine with the most seats is N670US.
(SELECT tailnum, engines, seats FROM planes WHERE engines ='1' ORDER BY seats DESC LIMIT 1)
UNION
(SELECT tailnum, engines, seats FROM planes WHERE engines ='2' ORDER BY seats DESC LIMIT 1)
UNION
(SELECT tailnum, engines, seats FROM planes WHERE engines ='3' ORDER BY seats DESC LIMIT 1)
UNION
(SELECT tailnum, engines, seats FROM planes WHERE engines ='4' ORDER BY seats DESC LIMIT 1);

-- 3. Show the total number of flights.
-- Result: The total number of flights is 336,776.
SELECT COUNT(*)
FROM flights;

-- 4. Show the total number of flights by airline (carrier).
-- Result:
-- 9E	18,460
-- AA	32,729
-- AS	714
-- B6	54,635
-- DL	48,110
-- EV	54,173
-- F9	685
-- FL	3,260
-- HA	342
-- MQ	26,397
-- OO	32
-- UA	58,665
-- US	20,536
-- VX	5,162
-- WN	12,275
-- YV	601
SELECT carrier, COUNT(*)
FROM flights
GROUP BY carrier
ORDER BY carrier;

-- 5. Show all of the airlines, ordered by number of flights in descending order.
-- Result:
-- UA	58,665
-- B6	54,635
-- EV	54,173
-- DL	48,110
-- AA	32,729
-- MQ	26,397
-- US	20,536
-- 9E	18,460
-- WN	12,275
-- VX	5,162
-- FL	3,260
-- AS	714
-- F9	685
-- YV	601
-- HA	342
-- OO	32
SELECT carrier, COUNT(*)
FROM flights
GROUP BY carrier
ORDER BY COUNT(*) DESC;

-- 6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.
-- Result:
-- UA	58,665
-- B6	54,635
-- EV	54,173
-- DL	48,110
-- AA	32,729
SELECT carrier, COUNT(*)
FROM flights
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 5;

-- 7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of flights in descending order.
-- Result:
-- UA	41,135
-- B6	30,022
-- DL	28,096
-- AA	23,583
-- EV	6,248
SELECT carrier, COUNT(*)
FROM flights
WHERE distance >= 1000
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 5;


-- 8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and write down both the question, and the query that answers the question.
-- My Question: What is the average temperature recorded at each New York City area airport in 2013?
-- My Result:
-- EWR	55.5
-- JFK	51.6
-- LGA	75.9
SELECT origin, ROUND(AVG(temp),1) AS AverageTemp
FROM weather
WHERE year = '2013'
	AND origin IN ('EWR','JFK','LGA')
GROUP BY origin;
