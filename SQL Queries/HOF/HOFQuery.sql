SELECT nameLast, nameFirst, SUM(H) AS H, ROUND(SUM(H) / SUM(AB), 3) AS AVG, SUM(HR) AS HR, SUM(RBI) AS RBI, ROUND(SUM(H+2B+2*3B+3*HR)/SUM(AB), 3) AS SLG, ROUND(SUM(H+BB+HBP) / SUM(AB+BB+HBP+COALESCE(SF,0)), 3) AS OBP, "?" AS Inducted 
FROM batting b, master m
WHERE b.playerID = m.playerID and (nameLast = "Pedroia" or nameLast = "Biggio" or (nameLast = "Ortiz" and nameFirst = "David"))
GROUP BY m.playerID;