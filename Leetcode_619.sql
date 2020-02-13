/*
Biggest Single Number

Table my_numbers contains many numbers in column num including duplicated ones.
Can you write a SQL query to find the biggest number, which only appears once.

+---+
|num|
+---+
| 8 |
| 8 |
| 3 |
| 3 |
| 1 |
| 4 |
| 5 |
| 6 | 
For the sample data above, your query should return the following result:
+---+
|num|
+---+
| 6 |
Note:
If there is no such number, just output null.
*/

# MY SOLUTION (SLOWER)
SELECT MAX(num) AS num
FROM (SELECT num, COUNT(num) AS freq
      FROM my_numbers
      GROUP BY num) AS a
WHERE freq = 1

# SOLUTION by Leetcode (FASTEST)
SELECT MAX(a.num) AS num
FROM (SELECT num
      FROM my_numbers
      GROUP BY num
      HAVING COUNT(*) = 1) AS a
