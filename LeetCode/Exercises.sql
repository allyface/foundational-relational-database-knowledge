-- #175 - Combine Two Tables

SELECT Email FROM (SELECT Email, COUNT(Email) FROM Person
WHERE COUNT(Email) > 1)Subquery;
