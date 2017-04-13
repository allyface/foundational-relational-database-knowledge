-- #182 - Duplicate Emails
  -- Write a SQL query to find all duplicate emails in a table named Person.

SELECT Email FROM (SELECT Email, COUNT(Email) FROM Person
WHERE COUNT(Email) > 1)Subquery;


-- #175 - Combine Two Tables
  -- Write a SQL query for a report that provides the following information for each person in the Person table, regardless if there is an address for each of those people:
    -- FirstName, LastName, City, State

SELECT FirstName, LastName, City, State FROM Person
LEFT JOIN Address ON Person.PersonId = Address.PersonId;


-- #181 - Employees Earning More Than Their Managers
  -- Given the Employee table, write a SQL query that finds out employees who earn more than their managers. For the above table, Joe is the only employee who earns more than his manager.

SELECT a.name AS Employee FROM Employee a LEFT JOIN Employee b
ON a.ManagerID = b.Id
WHERE a.Salary > b.Salary;


-- #183 - Customers Who Never Order
  -- Suppose that a website contains two tables, the Customers table and the Orders table. Write a SQL query to find all customers who never order anything.

  SELECT Name AS Customers FROM Customers
  LEFT JOIN Orders ON Customers.Id = Orders.CustomerId
  WHERE Orders.Id IS NULL;


-- #197 - Rising Temperature
  -- Given a Weather table, write a SQL query to find all dates' Ids with higher temperature compared to its previous (yesterday's) dates.

SELECT B.Id FROM Weather A
JOIN Weather B
ON TO_DAYS(A.Date) = TO_DAYS(B.Date) - 1
WHERE a.Temperature < b.Temperature;


-- #196 - Delete Duplicate Emails
  -- Write a SQL query to delete all duplicate email entries in a table named Person, keeping only unique emails based on its smallest Id.
