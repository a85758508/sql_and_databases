# Tutorial 6 for SQL Zoo

# Question 1:
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

# Question 2:
SELECT id,stadium,team1,team2
  FROM game 
 WHERE id = '1012'

# Question 3:
SELECT player, teamid, mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'

# Question 4:
SELECT team1, team2, player
FROM game JOIN goal ON (id=matchid)
WHERE player LIKE '%Mario%'

# Question 5:
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam on teamid = id
 WHERE gtime<=10

 # Question 6:
 SELECT mdate, teamname
FROM game JOIN eteam ON team1 = eteam.id
WHERE coach = 'Fernando Santos'

# Question 7:
SELECT player
FROM game JOIN goal ON id = matchid
WHERE stadium = 'National Stadium, Warsaw'

# Question 8: 
SELECT  DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE  teamID <> 'GER' AND (team1 = 'GER' OR team2 = 'GER')

# Question 9:
SELECT teamname, COUNT(*)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname

 # Question 10:
 SELECT stadium, COUNT(*)
FROM game JOIN goal ON id = matchid
GROUP BY stadium

# Question 11:
SELECT matchid,mdate, COUNT(*)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid

# Question 12:
SELECT matchid, mdate, COUNT(teamid)
FROM game JOIN goal ON matchid = id
WHERE teamid = 'GER'
GROUP BY matchid

# Question 13:
SELECT  mdate, team1, 
SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1, team2,
SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2 FROM game LEFT JOIN goal ON id=matchid
GROUP BY mdate, matchid, team1, team2
