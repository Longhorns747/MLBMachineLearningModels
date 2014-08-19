SELECT SUM(H) AS H, ROUND(SUM(H) / SUM(AB), 3) AS AVG, SUM(HR) AS HR, SUM(RBI) AS RBI, 
ROUND(SUM(H+2B+2*3B+3*HR)/SUM(AB), 3) AS SLG, 
COALESCE(ROUND(SUM(H+BB+HBP) / SUM(AB+BB+HBP+COALESCE(SF,0)), 3), 0) AS OBP, 
CASE WHEN EXISTS (SELECT m.playerID from halloffame h where m.hofid = h.hofid AND inducted = 'Y') THEN 'Y' ELSE 'N' END AS Inducted  
FROM batting b, master m
WHERE b.playerID = m.playerID
GROUP BY m.playerID
HAVING SUM(G_batting) >= 1000
ORDER BY SUM(G_batting) asc;