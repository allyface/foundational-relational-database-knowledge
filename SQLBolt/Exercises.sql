-- EXCERCISE 1 DIRECTIONS:
  -- We will be using a database with data about some of Pixar's classic movies for most of our exercises. This first exercise will only involve the Movies table, and the default query below currently shows all the properties of each movie. To continue onto the next lesson, alter the query to find the exact information we need for each task.

-- Excercise 1.1 - Find the title of each film
SELECT Title FROM movies;

-- Excercise 1.2 - Find the director of each film
SELECT Director FROM movies;

-- Excercise 1.3 - Find the title and director of each film
SELECT Title, Director FROM movies;

-- Excercise 1.4 - Find the title and year of each film
SELECT Title, Year FROM movies;

-- Excercise 1.5 - Find all the information about each film
SELECT * FROM movies;


-- EXCERCISE 2 DIRECTIONS:
  -- Using the right constraints, find the information we need from the Movies table for each task below.

-- Excercise 2.1 Find the movie with a row id of 6
SELECT * FROM movies
WHERE id = 6;

-- Excercise 2.2 Find the movies released in the years between 2000 and 2010
SELECT * FROM movies
WHERE year BETWEEN 2000 AND 2010;

-- Excercise 2.3 Find the movies not released in the years between 2000 and 2010
SELECT * FROM movies
WHERE year NOT BETWEEN 2000 AND 2010;

-- Excercise 2.4 Find the first 5 Pixar movies and their release year
SELECT * FROM movies
WHERE id < 6;


-- EXCERCISE 3 DIRECTIONS:
  -- Here's the definition of a query with a WHERE clause again, go ahead and try and write some queries with the operators above to limit the results to the information we need in the tasks below.

-- Excercise 3.1 Find all the Toy Story movies
SELECT * FROM movies
WHERE Title LIKE "Toy Story%";

-- Excercise 3.2 Find all the movies directed by John Lasseter
SELECT * FROM movies
WHERE Director = "John Lasseter";

-- Excercise 3.3 Find all the movies (and director) not directed by John Lasseter
SELECT * FROM movies
WHERE Director != "John Lasseter";

-- Find all the WALL-* movies
SELECT * FROM movies
WHERE Title LIKE "WALL-_";


-- EXCERCISE 4 DIRECTIONS:
  -- There are a few concepts in this lesson, but all are pretty straight-forward to apply. To spice things up, we've gone and scrambled the Movies table for you in the exercise to better mimic what kind of data you might see in real life. Try and use the necessary keywords and clauses introduced above in your queries.

-- Excercise 4.1 List all directors of Pixar movies (alphabetically), without duplicates
SELECT DISTINCT Director FROM movies
ORDER BY Director ASC;

-- Excercise 4.2 List the last four Pixar movies released (ordered from most recent to least)
SELECT * FROM movies
ORDER BY Year DESC
LIMIT 4;

-- Excercise 4.3 List the first five Pixar movies sorted alphabetically
SELECT * FROM movies
ORDER BY Title ASC
LIMIT 5;

-- Excercise 4.4 List the next five Pixar movies sorted alphabetically
SELECT * FROM movies
ORDER BY Title ASC
LIMIT 5 OFFSET 5;


-- EXCERCISE 5 DIRECTIONS
  -- Try and write some queries to find the information requested in the tasks you know. You may have to use a different combination of clauses in your query for each task. Once you're done, continue onto the next lesson to learn about queries that span multiple tables.

-- Excercise 5.1 - List all the Canadian cities and their populations
SELECT * FROM north_american_cities
WHERE Country = "Canada";

-- Excercise 5.2 - Order all the cities in the United States by their latitude from north to south
SELECT * FROM north_american_cities
WHERE Country = "United States"
ORDER BY Latitude DESC;

-- Excercise 5.3 - List all the cities west of Chicago, ordered from west to east
SELECT * FROM north_american_cities
WHERE Longitude < -87.629798
ORDER BY Longitude ASC;

-- Excercise 5.4 - List the two largest cities in Mexico (by population)
SELECT * FROM north_american_cities
WHERE Country = "Mexico"
ORDER BY Population DESC
LIMIT 2;

-- Excercise 5.5 - List the third and fourth largest cities (by population) in the United States and their population
SELECT * FROM north_american_cities
WHERE Country = "United States"
ORDER BY Population DESC
LIMIT 2 OFFSET 2;


-- EXCERCISE 6 DIRECTIONS
  -- We've added a new table to the Pixar database so that you can try practicing some joins. The BoxOffice table stores information about the ratings and sales of each particular Pixar movie, and the Movie_id column in that table corresponds with the Id column in the Movies table 1-to-1. Try and solve the tasks below using the INNER JOIN introduced above.

-- Excercise 6.1 - Find the domestic and international sales for each movie
SELECT * FROM movies
INNER JOIN Boxoffice
ON Movies.id = Boxoffice.Movie_id;

-- Excercise 6.2 - Show the sales numbers for each movie that did better internationally rather than domestically
SELECT * FROM movies
INNER JOIN Boxoffice
ON Movies.id = Boxoffice.Movie_id
WHERE Domestic_sales < International_sales;

-- Excercise 6.3 - List all the movies by their ratings in descending order
SELECT * FROM movies
INNER JOIN Boxoffice
ON Movies.id = Boxoffice.Movie_id
ORDER BY Rating DESC;


-- EXCERCISE 7 DIRECTIONS
  -- In this exercise, you are going to be working with a new table which stores fictional data about Employees in the film studio and their assigned office Buildings. Some of the buildings are new, so they don't have any employees in them yet, but we need to find some information about them regardless.

  -- Since our browser SQL database is somewhat limited, only the LEFT JOIN is supported in the exercise below.

-- Excercise 7.1 - Find the list of all buildings that have employees
SELECT DISTINCT Building FROM Employees
LEFT JOIN Buildings
ON Employees.Building = Buildings.Building_name;

-- Excercise 7.2 - Find the list of all buildings and their capacity
SELECT DISTINCT Building_name, Capacity FROM Buildings
LEFT JOIN Employees
ON Employees.Building = Buildings.Building_name;

-- Excercise 7.3 - List all buildings and the distinct employee roles in each building (including empty buildings)
SELECT DISTINCT Building_name, Role FROM Buildings
LEFT JOIN Employees
ON Employees.Building = Buildings.Building_name;


-- EXCERCISE 8 DIRECTIONS
  -- This exercise will be a sort of review of the last few lessons. We're using the same Employees and Buildings table from the last lesson, but we've hired a few more people, who haven't yet been assigned a building.

-- Excercise 8.1 - Find the name and role of all employees who have not been assigned to a building
SELECT * FROM Employees
LEFT JOIN Buildings
ON Buildings.Building_name = Employees.Building
WHERE Employees.Building IS NULL;

-- Excercise 8.2 - Find the names of the buildings that hold no employees
SELECT * FROM Buildings
LEFT JOIN Employees
ON Buildings.Building_name = Employees.Building
WHERE Employees.Role IS NULL;


-- EXCERCISE 9 DIRECTIONS
  -- You are going to have to use expressions to transform the BoxOffice data into something easier to understand for the tasks below.

-- Excercise 9.1 - List all movies and their combined sales in millions of dollars
SELECT Title, ((Domestic_sales+International_sales)/1000000) AS Combined_sales FROM movies
INNER JOIN Boxoffice
ON Movies.id = Boxoffice.Movie_id;

-- Excercise 9.2 - List all movies and their ratings in percent
SELECT Title, (Rating * 10) AS Rating_percent FROM movies
INNER JOIN Boxoffice
ON Movies.id = Boxoffice.Movie_id;

-- Excercise 9.3 - List all movies that were released on even number years
SELECT Title, Year FROM movies
INNER JOIN Boxoffice
ON Movies.id = Boxoffice.Movie_id
WHERE Year%2 = 0;


-- EXCERCISE 10 DIRECTIONS
  -- For this exercise, we are going to work with our Employees table. Notice how the rows in this table have shared data, which will give us an opportunity to use aggregate functions to summarize some high-level metrics about the teams. Go ahead and give it a shot.

-- Excercise 10.1 - Find the longest time that an employee has been at the studio
SELECT MAX(Years_employed) AS Longest_time FROM employees;

-- Excercise 10.2 - For each role, find the average number of years employed by employees in that role
SELECT Role, AVG(Years_employed) FROM employees
GROUP BY Role;

-- Excercise 10.3 - Find the total number of employee years worked in each building
SELECT Building, SUM(Years_employed) FROM employees
GROUP BY Building;


-- EXCERCISE 11 DIRECTIONS
  -- For this exercise, you are going to dive deeper into Employee data at the film studio. Think about the different clauses you want to apply for each task.

-- Excercise 11.1 - Find the number of Artists in the studio (without a HAVING clause)
SELECT Role, Count(*) FROM employees
WHERE Role = "Artist";

-- Excercise 11.2 - Find the number of Employees of each role in the studio
SELECT Role, Count(*) FROM employees
GROUP BY Role;

-- Excercise 11.3 - Find the total number of years employed by all Engineers
SELECT Role, SUM(Years_employed) FROM employees
WHERE Role = "Engineer";


-- EXCERCISE 12 DIRECTIONS
  -- Here ends our lessons on SELECT queries, congrats of making it this far! This exercise will try and test your understanding of queries, so don't be discouraged if you find them challenging. Just try your best.

-- Excercise 12.1 - Find the number of movies each director has directed
SELECT Director, COUNT(*) FROM movies
GROUP BY Director;

-- Excercise 12.2 - Find the total domestic and international sales that can be attributed to each director
SELECT Director, SUM(Domestic_sales + International_sales) AS Total_sales FROM movies
INNER JOIN Boxoffice
ON movies.id = boxoffice.movie_id
GROUP BY Director;


-- EXCERCISE 13 DIRECTIONS
  -- In this exercise, we are going to play studio executive and add a few movies to the Movies to our portfolio. In this table, the Id is an auto-incrementing integer, so you can try inserting a row with only the other columns defined.

-- Excercise 13.1 - Add the studio's new production, Toy Story 4 to the list of movies (you can use any director)
INSERT INTO Movies
(Title, Director, Year, Length_minutes)
VALUES ("Toy Story 4", "Quentin Tarantino", 2017, 120);

-- Excercise 13.2 - Toy Story 4 has been released to critical acclaim! It had a rating of 8.7, and made 340 million domestically and 270 million internationally. Add the record to the  BoxOffice table.
INSERT INTO Boxoffice
VALUES (15, 8.7, 340000000, 270000000);


-- EXCERCISE 14 DIRECTIONS
  -- It looks like some of the information in our Movies database might be incorrect, so go ahead and fix them through the exercises below.

-- Excercise 14.1 - The director for A Bug's Life is incorrect, it was actually directed by John Lasseter
UPDATE Movies
SET Director = "John Lasseter"
WHERE Title = "A Bug's Life";

-- Excercise 14.2 - The year that Toy Story 2 was released is incorrect, it was actually released in 1999
UPDATE Movies
SET Year = 1999
WHERE Title = "Toy Story 2";

-- Excercise 14.3 - Both the title and directory for Toy Story 8 is incorrect! The title should be "Toy Story 3" and it was directed by Lee Unkrich
UPDATE Movies
SET Title = "Toy Story 3",
    Director = "Lee Unkrich"
WHERE Title = "Toy Story 8";


-- EXCERCISE 15 DIRECTIONS
  -- The database needs to be cleaned up a little bit, so try and delete a few rows in the tasks below.

-- Excercise 15.1 - This database is getting too big, lets remove all movies that were released before 2005.
DELETE FROM Movies
WHERE Year < 2005;

-- Excercise 15.2 - Andrew Stanton has also left the studio, so please remove all movies directed by him.
DELETE FROM Movies
WHERE Director = "Andrew Stanton";


-- EXCERCISE 16 DIRECTIONS
  -- In this exercise, you'll need to create a new table for us to insert some new rows into.

-- Excercise 16.1 - Create a new table named Database with the following columns:
  -- Name A string (text) describing the name of the database
  -- Version A number (floating point) of the latest version of this database
  -- Download_count An integer count of the number of times this database was downloaded
  -- This table has no constraints.
CREATE TABLE Database (
  Name TEXT,
  Version FLOAT,
  Download_count INTEGER
);


-- EXCERCISE 17 DIRECTIONS
  -- Our exercises use an implementation that only support adding new columns, so give that a try below.

-- Excercise 17.1 - Add a column named Aspect_ratio with a FLOAT data type to store the aspect-ratio each movie was released in.
ALTER TABLE Movies
ADD Aspect_ratio FLOAT;

-- Excercise 17.2 - Add another column named Language with a TEXT data type to store the language that the movie was released in. Ensure that the default for this language is English.
ALTER TABLE Movies
ADD Language TEXT
    DEFAULT English;


-- EXCERCISE 18 DIRECTIONS
  -- We've reached the end of our exercises, so lets clean up by removing all the tables we've worked with.

-- Excercise 18.1 - We've sadly reached the end of our lessons, lets clean up by removing the Movies table
DROP TABLE IF EXISTS Movies;

-- Excercise 18.2 - And drop the BoxOffice table as well
DROP TABLE IF EXISTS BoxOffice;
