SELECT SUM(W) AS W, ROUND(9 * (SUM(SO) / (SUM(IPOuts) / 3)), 2) AS Kper9, SUM(ROUND((IPOuts / 3), 1)) AS IP, 
ROUND(9 * (SUM(ER) / (SUM(IPOuts) / 3)), 2) AS ERA, 
ROUND((SUM(BB) + SUM(H)) / (SUM(IPOuts) / 3), 2) AS WHIP,
CASE WHEN EXISTS (SELECT m.playerID from halloffame h where m.hofid = h.hofid AND inducted = 'Y') THEN 'Y' ELSE 'N' END AS Inducted  
FROM pitching p, master m
WHERE p.playerID = m.playerID
GROUP BY m.playerID
HAVING IP >= 70
ORDER BY IP desc;