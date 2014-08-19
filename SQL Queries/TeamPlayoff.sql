SELECT HR, SOA, R, RA,
ROUND((H+2B+2*3B+3*HR)/AB, 3) AS SLG, ERA, BB,
ROUND(((BBA) + (HA)) / ((IPOuts) / 3), 2) AS WHIP,
ROUND(H / AB, 3) AS AVG,
COALESCE(CASE 
WHEN W / (W + L) >= .40 AND W / (W + L) <= .45 THEN '.400'
WHEN W / (W + L) >= .45 AND W / (W + L) <= .50 THEN '.450'
WHEN W / (W + L) >= .50 AND W / (W + L) <= .55 THEN '.500'
WHEN W / (W + L) >= .55 AND W / (W + L) <= .60 THEN '.550'
WHEN W / (W + L) >= .60 THEN '.600'
END) AS Result 
FROM teams t
WHERE W / (W + L) >= .40
ORDER BY Result asc;