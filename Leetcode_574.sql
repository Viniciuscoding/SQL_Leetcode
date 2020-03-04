/*
Winning Candidate

Table: Candidate

+-----+---------+
| id  | Name    |
+-----+---------+
| 1   | A       |
| 2   | B       |
| 3   | C       |
| 4   | D       |
| 5   | E       |
+-----+---------+  
Table: Vote

+-----+--------------+
| id  | CandidateId  |
+-----+--------------+
| 1   |     2        |
| 2   |     4        |
| 3   |     3        |
| 4   |     2        |
| 5   |     5        |
+-----+--------------+
id is the auto-increment primary key,
CandidateId is the id appeared in Candidate table.
Write a sql to find the name of the winning candidate, the above example will return the winner B.

+------+
| Name |
+------+
| B    |
+------+
Notes:

You may assume there is no tie, in other words there will be only one winning candidate.

*/

# MY SOLUTION (longer and slower)
SELECT Name
FROM Candidate
WHERE id = (SELECT winner.CandidateId
            FROM (SELECT id, CandidateId, COUNT(CandidateId) AS votes
                    FROM Vote
                    GROUP BY CandidateId
                    ORDER BY votes DESC
                    LIMIT 1) AS winner)

# SOLUTION by Peter233767 (shorter and faster)
SELECT Name
FROM Candidate
WHERE id = (SELECT CandidateId
            FROM Vote
            GROUP BY CandidateId
            ORDER BY COUNT(id) DESC
            LIMIT 1)

# SOLUTION by amymamy
SELECT Name
FROM Candidate c
INNER JOIN Vote v
ON c.id = v.CandidateId
GROUP BY v.CandidateId
ORDER BY COUNT(*) DESC
LIMIT 1
