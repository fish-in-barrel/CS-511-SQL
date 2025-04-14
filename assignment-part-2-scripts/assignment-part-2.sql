-- 1. [2 points] Write a SQL query that lists only the length of all movies with a ‘G' rating.
-- 2. [2 points] Write a Relational Algebra expression for Question 1.
\copy (
    SELECT m.length from movies as m where rating = 'G'
) To '/tmp/question-1.csv' WITH CSV DELIMITER ',' HEADER

-- 3. [3 points] Write a SQL query that lists only the phone number and district name of Landmark Neptune Theatre.
-- 4. [3 points] Write a Relational Algebra expression for Question 3.
\copy (
    SELECT t.phone as theatre_phone, d.name as district from theaters as t
    INNER JOIN theaters2districts as t2d ON t2d.theater_id = t.theater_id
    INNER JOIN districts as d ON t2d.district_id = d.district_id
    WHERE t.name = 'Landmark Neptune Theatre'
) To '/tmp/question-3.csv' WITH CSV DELIMITER ',' HEADER

-- 5. [3 points] Write a SQL query that lists the distinct movie title, theater name, district name of movies that are played in the ‘Capitol Hill’ district.
-- 6. [3 points] Write a Relational Algebra expression for Question 5.
-- 7. [4 points] Compose a query plan for the Relational Algebra expression from Question 6.
\copy (
    SELECT DISTINCT m.title as movie_title, t.name as theater, d.name as district from districts as d
    INNER JOIN theaters2districts as t2d ON t2d.district_id = d.district_id
    INNER JOIN theaters as t ON t2d.theater_id = t.theater_id
    INNER JOIN movies2theaters as m2t ON m2t.theater_id = t.theater_id
    INNER JOIN movies as m ON m2t.movie_id = m.movie_id
    WHERE d.name = 'Capitol Hill'
) To '/tmp/question-5.csv' WITH CSV DELIMITER ',' HEADER

-- 8. [4 points] Write a query that finds total number of theaters playing each movie. Output(Movie name, Theater count).
\copy (
    SELECT m.title as movie_title, count(*) as theater_frequency from theaters as t
    INNER JOIN theaters2districts as t2d ON t2d.theater_id = t.theater_id
    INNER JOIN districts as d ON t2d.district_id = d.district_id
    INNER JOIN movies2theaters as m2t ON m2t.theater_id = t.theater_id
    INNER JOIN movies as m ON m2t.movie_id = m.movie_id
    GROUP BY m.title
) To '/tmp/question-8.csv' WITH CSV DELIMITER ',' HEADER

--9. [4 points] Write a query that lists the theater name and average length of movies shown in the theater.
\copy(
    SELECT t.name as movie_title, avg(m.length) as average_feature_length from theaters as t
    INNER JOIN theaters2districts as t2d ON t2d.theater_id = t.theater_id
    INNER JOIN districts as d ON t2d.district_id = d.district_id
    INNER JOIN movies2theaters as m2t ON m2t.theater_id = t.theater_id
    INNER JOIN movies as m ON m2t.movie_id = m.movie_id
    GROUP BY t.name
) To '/tmp/question-9.csv' WITH CSV DELIMITER ',' HEADER

-- 10. [4 points] Write a query to find the theaters in each district playing movies greater than the average length of all movies. List district, theater, movie and length.
\copy (
    SELECT d.name as district, t.name as theater, m.title as movie_title , m.length as feature_length from theaters as t
    INNER JOIN theaters2districts as t2d ON t2d.theater_id = t.theater_id
    INNER JOIN districts as d ON t2d.district_id = d.district_id
    INNER JOIN movies2theaters as m2t ON m2t.theater_id = t.theater_id
    INNER JOIN movies as m ON m2t.movie_id = m.movie_id
    WHERE m.length > (
        SELECT avg(length) from movies
    )
) To '/tmp/question-10.csv' WITH CSV DELIMITER ',' HEADER

-- 11. [7 points] Write a query that lists movie name, rating and length where rating contains the letter ‘R’ and has a length greater than 100.
\copy (
    SELECT m.title as movie_title, m.rating as rating, m.length as feature_length from movies as m
    WHERE m.rating LIKE '%R%'
    AND m.length > 100
) To '/tmp/question-11.csv' WITH CSV DELIMITER ',' HEADER

-- 12. [7 points] Write a query to list movie name, movie rating, length, theater and district for the longest ‘R’ rated movie or any ‘PG’ rated movie
\copy (
    SELECT m.title, m.rating, m.length, t.name as theater, d.name as district from theaters as t
    INNER JOIN theaters2districts as t2d ON t2d.theater_id = t.theater_id
    INNER JOIN districts as d ON t2d.district_id = d.district_id
    INNER JOIN movies2theaters as m2t ON m2t.theater_id = t.theater_id
    INNER JOIN movies as m ON m2t.movie_id = m.movie_id
    WHERE m.rating = 'R' 
    AND m.length = (
        SELECT max(length) from movies where rating = 'R'
    )
    OR m.rating = 'PG' 
    AND m.length = (
        SELECT max(length) from movies where rating = 'PG'
    )
) To '/tmp/question-12.csv' WITH CSV DELIMITER ',' HEADER

-- 13. [3 points] Write a query to list movie, theater and movietime of all movies played after 19:00:00
\copy ( 
    SELECT m.title as movie_title, t.name as theater, m2t.movie_time from theaters as t
    INNER JOIN theaters2districts as t2d ON t2d.theater_id = t.theater_id
    INNER JOIN districts as d ON t2d.district_id = d.district_id
    INNER JOIN movies2theaters as m2t ON m2t.theater_id = t.theater_id
    INNER JOIN movies as m ON m2t.movie_id = m.movie_id
    WHERE m2t.movie_time > '19:00:00'
) To '/tmp/question-13.csv' WITH CSV DELIMITER ',' HEADER

-- 14. [4 points] Write a query that shows movie name, theater name, district name and movie count which 
--                shows the movie that was played the most number of times in all districts.
\copy (
    SELECT m.title as movie_title, t.name as theater, d.name as district, count(*) as movie_count from theaters as t
    INNER JOIN theaters2districts as t2d ON t2d.theater_id = t.theater_id
    INNER JOIN districts as d ON t2d.district_id = d.district_id
    INNER JOIN movies2theaters as m2t ON m2t.theater_id = t.theater_id
    INNER JOIN movies as m ON m2t.movie_id = m.movie_id
    GROUP BY m.title, t.name, d.name
    HAVING count(*) = (
        SELECT max(movie_count) from (
            SELECT count(*) as movie_count from theaters as t
            INNER JOIN theaters2districts as t2d ON t2d.theater_id = t.theater_id
            INNER JOIN districts as d ON t2d.district_id = d.district_id
            INNER JOIN movies2theaters as m2t ON m2t.theater_id = t.theater_id
            INNER JOIN movies as m ON m2t.movie_id = m.movie_id
            GROUP BY m.title, t.name, d.name
        ) as subquery
    )
) To '/tmp/question-14.csv' WITH CSV DELIMITER ',' HEADER

