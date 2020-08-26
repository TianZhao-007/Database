-----------------------------------------------------------------------------------------
--Only used for COMP2400 students in S2 2020
--Please enter your SQL queries to Question 1.1-1.10 
--Please input your UID here: U1234567
------------------------------------------------------------------------------------------

-- Q1.1
SELECT award_name
FROM award
WHERE lower(country) = 'usa';

-- Q1.2

SELECT title
FROM movie
WHERE production_year = '1994' AND major_genre = 'comedy';


-- Q1.3





SELECT DISTINCT  person.id,first_name,last_name
FROM person,role AS r
WHERE person.id = r.id AND r.production_year = '1995';




-- Q1.4




SELECT COUNT(d)
FROM (SELECT DISTINCT director.id FROM director,writer WHERE director.id = writer.id) AS d;





-- Q1.5




SELECT movie.title,movie.production_year,COUNT(restriction.country)
FROM movie,restriction
WHERE restriction.title = movie.title AND restriction.description ='PG'
GROUP BY movie.title,movie.production_year
HAVING COUNT(movie.country)>1;





-- Q1.6



SELECT w.id,p.first_name,p.last_name
FROM writer AS w,PERSON AS p
WHERE w.id = p.id
GROUP BY w.id,p.first_name,p.last_name
HAVING COUNT(w.title) = 2
ORDER BY w.id ASC;






-- Q1.7



SELECT COUNT(*)
FROM (SELECT id FROM director
EXCEPT
SELECT id FROM role) AS dn;





-- Q1.8


WITH CrewNum AS (SELECT id,COUNT(*) AS num
FROM crew
GROUP BY id)
SELECT cn.id,person.first_name,person.last_name
FROM CrewNum cn,person
WHERE person.id = cn.id AND  cn.num = (SELECT MAX(num)
FROM CrewNum);






-- Q1.9




SELECT id
FROM person
WHERE id IN (SELECT id       
FROM writer_award natural join writer
WHERE lower(result) <> 'won'
GROUP BY id  
EXCEPT
SELECT id
FROM writer_award natural join writer
WHERE lower(result)  = 'won');





-- Q1.10











----------------------------------------------------------------
-- End of your answers
-----------------------------------------------------------------
