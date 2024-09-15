WITH YY AS (
	WITH XX AS (
		SELECT district, area, pd.postal2d, lat_long
		FROM post_dist_table1 AS pd
		JOIN post_latlong_table1 AS pl
		ON pd.postal2d = pl.postal2d
		)
	SELECT DISTINCT district, area, XX.lat_long, description, racktype, rackcount, shelterindicator
	FROM XX
	JOIN bike25k_transform_table1 AS bt
	ON XX.lat_long = bt.lat_long
	)

SELECT district, area, count(description) AS bus_stops_with_parking, sum(rackcount) AS total_bus_stop_parking_slots
FROM YY
WHERE district IN (18, 22, 25) AND description LIKE 'BUS STOP%'
GROUP BY district, area
UNION
SELECT *
FROM district_central9
ORDER BY district




