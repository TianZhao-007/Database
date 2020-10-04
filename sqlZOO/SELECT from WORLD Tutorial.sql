SELECT name, continent, population FROM world;

SELECT name FROM world
WHERE population >= 200000000;

SELECT name,GDP/population
FROM world
WHERE population>=200000000;

SELECT name,population FROM world
WHERE name IN ('France','Germany','Italy');

SELECT name FROM world 
WHERE name LIKE 'United%';

SELECT name,population,area
FROM world 
WHERE area>3000000 or population>250000000;

SELECT name,population,area
FROM world 
WHERE area>3000000 XOR population>250000000;
/* exclusive or-----XOR*/

SELECT 