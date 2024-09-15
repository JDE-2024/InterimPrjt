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

SELECT district, area, COUNT(shelterindicator) AS sum_location, (SELECT count(shelterindicator) FROM YY AS sub WHERE shelterindicator = 'Y' AND sub.district = YY.district) AS with_shelter, (SELECT count(shelterindicator) FROM YY AS sub WHERE shelterindicator = 'N' AND sub.district = YY.district) AS no_shelter
FROM YY
WHERE district IN (22, 25)
GROUP BY district, area
ORDER BY district
