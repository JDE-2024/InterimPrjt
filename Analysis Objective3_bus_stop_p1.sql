CREATE TABLE district_central9 (
    district INTEGER,
    area VARCHAR(50),
    bus_stops_with_parking INTEGER,
    total_bus_stop_parking_slots NUMERIC
);

WITH ZZ AS(

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

--	SELECT district, area, COUNT(description) AS bus_stops_with_parking, SUM(rackcount) AS total_bus_stop_parking_slots
	SELECT district, area, COUNT(description) AS bb, SUM(rackcount) AS tt
	FROM YY
	WHERE district IN (1,2,3,4,6,7,8,9) AND description LIKE 'BUS STOP%'
	GROUP BY district, area
)

INSERT INTO district_central9 (district, area, bus_stops_with_parking, total_bus_stop_parking_slots)
VALUES
(NULL, 'Central Dist 1-4, 6-9', (SELECT SUM(bb) FROM ZZ), (SELECT SUM(tt) FROM ZZ));

SELECT * 
FROM district_central9

