USE pc

SELECT convert(decimal(9,2),AVG(speed)) AS AVG
FROM pc;

SELECT maker,AVG(screen)
FROM laptop JOIN product ON product.model = laptop.model
GROUP BY product.maker;

SELECT convert(decimal(9,2),AVG(speed)) AS avg
FROM laptop
WHERE price > 1000;

SELECT convert(decimal(9,2),AVG(price)) AS "AVG Price"
FROM pc JOIN product ON pc.model = product.model AND maker = 'A';


SELECT product.maker, convert(decimal(9,2),AVG(pcAndLap.price)) AS "AVG Price"
FROM product JOIN
((SELECT model, price
FROM pc)
UNION ALL
(SELECT model, price
FROM laptop)) AS pcAndLap ON product.model = pcAndLap.model
WHERE maker = 'B'
GROUP BY maker;

SELECT speed, AVG(price) AS price
FROM pc
GROUP BY speed;

SELECT maker, COUNT(pc.model) AS count
FROM product JOIN pc ON product.model = pc.model
GROUP BY product.maker
HAVING COUNT(pc.model) >= 3;

SELECT maker
FROM pc JOIN product ON pc.model = product.model
GROUP BY pc.model
HAVING MAX(pc.price);

SELECT pc.speed, convert(decimal(9,2),AVG(pc.price)) AS "AVG Price"
FROM pc 
WHERE pc.speed > 800
GROUP BY pc.speed;

SELECT convert(decimal(9,2),AVG(hd)) AS "AVG hd"
FROM pc JOIN 
((SELECT product.maker, product.model
FROM product JOIN printer ON product.model = printer.model) 
INTERSECT
(SELECT product.maker, product.model
FROM product JOIN pc ON product.model = pc.model) ) AS pr
ON pc.model = pr.model;


SELECT convert(decimal(9,2),AVG(hd)) AS "AVG hd"
FROM product AS pr1 JOIN pc ON pr1.model = pc.model, 
		product AS pr2 JOIN printer ON pr2.model = printer.model
WHERE pr1.maker = pr2.maker;


SELECT convert(decimal(9,2),AVG(pc1.hd)) AS "AVG hd"
FROM pc AS pc1, product AS prod, 
((SELECT maker
FROM product JOIN pc ON product.model = pc.model)
INTERSECT
(SELECT maker
FROM product JOIN printer ON product.model = printer.model)) AS pr2
WHERE prod.maker = pr2.maker AND pc1.model = prod.model;


USE ships

SELECT COUNT(CLASSES.CLASS)
FROM CLASSES;

SELECT CLASS, AVG(NUMGUNS)
FROM CLASSES
GROUP BY CLASS;

SELECT AVG(NUMGUNS)
FROM CLASSES;

SELECT CLASS, MIN(LAUNCHED) AS FirstYear, MAX(LAUNCHED) AS LastYear
FROM SHIPS
GROUP BY CLASS;

SELECT CLASS, COUNT(NAME)
FROM SHIPS, OUTCOMES
WHERE SHIPS.NAME = OUTCOMES.SHIP AND RESULT = 'sunk'
GROUP BY CLASS;

SELECT CLASS, COUNT(NAME)
FROM SHIPS, OUTCOMES
WHERE SHIPS.NAME = OUTCOMES.SHIP AND RESULT = 'sunk'
GROUP BY CLASS
HAVING SUM(CLASS) >= 2;


SELECT COUNTRY, AVG(BORE)
FROM CLASSES
GROUP BY COUNTRY;
