-- #182 - Duplicate Emails
  -- Write a SQL query to find all duplicate emails in a table named Person.

SELECT Email
  FROM (SELECT Email, COUNT(Email)
       FROM Person
       WHERE COUNT(Email) > 1)Subquery;


-- #175 - Combine Two Tables
  -- Write a SQL query for a report that provides the following information for each person in the Person table, regardless if there is an address for each of those people:
    -- FirstName, LastName, City, State

   SELECT FirstName, LastName, City, State
     FROM Person
LEFT JOIN Address
       ON Person.PersonId = Address.PersonId;


-- #181 - Employees Earning More Than Their Managers
  -- Given the Employee table, write a SQL query that finds out employees who earn more than their managers. For the above table, Joe is the only employee who earns more than his manager.

   SELECT a.name AS Employee
     FROM Employee a
LEFT JOIN Employee b
       ON a.ManagerID = b.Id
    WHERE a.Salary > b.Salary;


-- #183 - Customers Who Never Order
  -- Suppose that a website contains two tables, the Customers table and the Orders table. Write a SQL query to find all customers who never order anything.

   SELECT Name AS Customers
     FROM Customers
LEFT JOIN Orders ON Customers.Id = Orders.CustomerId
    WHERE Orders.Id IS NULL;


-- #197 - Rising Temperature
  -- Given a Weather table, write a SQL query to find all dates' Ids with higher temperature compared to its previous (yesterday's) dates.

SELECT B.Id
  FROM Weather A
  JOIN Weather B
    ON TO_DAYS(A.Date) = TO_DAYS(B.Date) - 1
 WHERE a.Temperature < b.Temperature;


-- #196 - Delete Duplicate Emails
  -- Write a SQL query to delete all duplicate email entries in a table named Person, keeping only unique emails based on its smallest Id.
DELETE p1
  FROM Person p1, Person p2
 WHERE p1.Email = p2.Email
   AND p1.Id > p2.Id;

-- #176 - Second Highest Salary
  -- Write a SQL query to get the second highest salary from the Employee table.

SELECT MAX(Salary) AS SecondHighestSalary
  FROM Employee
 WHERE Salary <
       (SELECT MAX(Salary)
       FROM Employee);

-- #178 Rank Scores
  -- Write a SQL query to rank scores. If there is a tie between two scores, both should have the same ranking. Note that after a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no "holes" between ranks.

SELECT Score, DENSE_RANK() OVER(ORDER BY Score DESC) AS Rank
  FROM Scores;

-- #184 Department Highest Salary
  -- Write a SQL query to find employees who have the highest salary in each of the departments. For the above tables, Max has the highest salary in the IT department and Henry has the highest salary in the Sales department.

SELECT Department.Name AS Department, a.Name AS Employee, Salary
  FROM  Employee a, Department
 WHERE a.DepartmentId = Department.Id
   AND Salary >= ALL
       (SELECT Salary
          FROM Employee b
         WHERE b.DepartmentId = a.DepartmentId);

-- #180 - Consecutive Numbers
  -- For example, given the above Logs table, 1 is the only number that appears consecutively for at least three times.

  SELECT DISTINCT A.Num AS ConsecutiveNums
             FROM Logs A, Logs B, Logs C
            WHERE (A.Id = B.Id + 1) AND (A.Id = C.Id + 2) AND (A.Num = B.Num) AND (B.Num = C.Num);
