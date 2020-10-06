SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature';

SELECT yr,subject
FROM nobel
WHERE winner= 'Albert Einstein';

SELECT winner
FROM nobel 
WHERE yr>=2000 and subject= 'Peace';

SELECT * 
FROM nobel
WHERE subject = 'Literature' AND yr>=1980 AND yr<=1989;

SELECT * FROM nobel
 WHERE subject = 'Peace' AND winner IN ('Theodore Roosevelt',
    'Woodrow Wilson',
    'Jimmy Carter',
    'Barack Obama')

select winner 
FROM nobel 
WHERE winner like 'John%';

SELECT yr, subject, winner FROM nobel 
WHERE (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984);

select *
FROM nobel
WHERE yr = 1980 AND subject<>'Chemistry' AND subject<>'Medicine';
/*SELECT yr, subject, winner FROM nobel
WHERE subject NOT IN ('Chemistry', 'Medicine') AND yr = 1980;*/

SELECT *
FROM nobel
WHERE (subject = 'Medicine' AND yr<1910) OR (subject = 'Literature' AND yr>=2004);

SELECT * FROM nobel
WHERE winner = 'PETER GRÜNBERG';

SELECT * FROM nobel
WHERE winner = 'EUGENE O''NEILL';

select winner,yr,subject
FROM nobel 
WHERE winner like 'Sir%'
ORDER BY yr DESC;

SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Chemistry','Physics'),subject,winner;
 /*The expression subject IN ('Chemistry','Physics') 
 can be used as a value - it will be 0 or 1.*/