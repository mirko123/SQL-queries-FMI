--USE movies

--SELECT MOVIESTAR.NAME
--FROM MOVIESTAR
--JOIN MOVIEEXEC ON MOVIEEXEC.NAME = MOVIESTAR.NAME 
--			AND MOVIEEXEC.NETWORTH > 10000000;

--SELECT MOVIESTAR.NAME
--FROM MOVIESTAR
--JOIN MOVIEEXEC ON MOVIEEXEC.NAME = MOVIESTAR.NAME 
--			AND MOVIEEXEC.NETWORTH > 10000000;

--(SELECT NAME
--FROM MOVIESTAR)
--EXCEPT
--(SELECT NAME
--FROM MOVIEEXEC);

--SELECT TITLE
--FROM MOVIE
--WHERE LENGTH > ANY (SELECT LENGTH
--					FROM MOVIE AS mov
--					WHERE mov.TITLE = 'Star Wars');

--SELECT MOVIE.TITLE, MOVIEEXEC.NAME
--FROM MOVIEEXEC, MOVIE
--WHERE PRODUCERC# = CERT# 
--			AND NETWORTH > ALL(SELECT NETWORTH
--								FROM MOVIEEXEC AS mExec
--								WHERE mExec.NAME = 'Merv Griffin');

USE pc

SELECT DISTINCT maker
FROM product, pc
WHERE product.model = pc.model AND pc.speed > 500;

SELECT DISTINCT *
FROM printer
WHERE price >= ALL(SELECT price
					FROM printer);

SELECT *
FROM laptop
WHERE speed < ALL(SELECT speed
					FROM pc);

SELECT DISTINCT prod.model, prod.price
FROM 
((SELECT model, price
FROM printer)
UNION
(SELECT model, price
FROM pc)
UNION
(SELECT model, price
FROM laptop)) AS prod
WHERE prod.price >= ALL(((SELECT price
FROM printer)
UNION
(SELECT price
FROM pc)
UNION
(SELECT price
FROM laptop)));

SELECT maker
FROM product, printer
WHERE printer.model = product. model AND printer.color = 'y'
					AND price <= ALL(SELECT price
									  FROM printer AS pr
									  WHERe pr.color = 'y');

SELECT maker
FROM product, pc
WHERE product.model = pc.model ;




USE ships

SELECT DISTINCT COUNTRY
FROM CLASSES
WHERE NUMGUNS >= ALL(SELECT NUMGUNS
					 FROM CLASSES);

SELECT DISTINCT CLASS
FROM SHIPS, OUTCOMES
WHERE SHIPS.NAME = OUTCOMES.SHIP AND OUTCOMES.RESULT = 'sunk';

SELECT SHIPS.NAME, SHIPS.CLASS
FROM SHIPS, CLASSES
WHERE SHIPS.CLASS = CLASSES.CLASS AND BORE = '16';

SELECT OUTCOMES.BATTLE
FROM OUTCOMES, SHIPS
WHERE OUTCOMES.SHIP = SHIPS.NAME AND SHIPS.CLASS = 'Kongo';

SELECT DISTINCT SHIPS.CLASS, SHIPS.NAME
FROM SHIPS, CLASSES AS cl1
WHERE SHIPS.CLASS = cl1.CLASS 
			AND cl1.NUMGUNS >= ALL(SELECT NUMGUNS
									FROM CLASSES AS cl2
									WHERE cl1.BORE = cl2.BORE);