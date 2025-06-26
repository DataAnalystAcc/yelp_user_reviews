-- checking the total rows of each table

SELECT COUNT(*) FROM business_raw;


SELECT COUNT(*) FROM checkin_raw;


SELECT COUNT(*) FROM review_raw;


SELECT COUNT(*) FROM tip_raw;


SELECT COUNT(*) FROM user_raw;


-- how many unique businesses? confrimed that the same as number of rows
SELECT count (DISTINCT business_id) 
FROM business_raw;


-- checking the timeframe of the tables containing timestamps
SELECT min(date),
        max(date)
FROM review_raw;

SELECT min(date),
        max(date)
FROM tip_raw;


-- check the NULLs

-- businesses
Select COUNT(*) from business_raw 
Where * is NULL;

-- checkins
SELECT
  SUM(CASE WHEN date IS NULL THEN 1 ELSE 0 END) AS checkins_null
FROM
  checkin_raw;

-- reviews
SELECT
  SUM(CASE WHEN review_id IS NULL THEN 1 ELSE 0 END) AS col1_nulls,
  SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) AS col2_nulls,
  SUM(CASE WHEN business_id IS NULL THEN 1 ELSE 0 END) AS col3_nulls,
  SUM(CASE WHEN stars IS NULL THEN 1 ELSE 0 END) AS col4_nulls,
  SUM(CASE WHEN useful IS NULL THEN 1 ELSE 0 END) AS col5_nulls,
  SUM(CASE WHEN funny IS NULL THEN 1 ELSE 0 END) AS col6_nulls,
  SUM(CASE WHEN cool IS NULL THEN 1 ELSE 0 END) AS col7_nulls,
  SUM(CASE WHEN date IS NULL THEN 1 ELSE 0 END) AS col8_nulls
FROM
  review_raw;
  
-- users
SELECT
  SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) AS col1_nulls,
  SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) AS col2_nulls,
  SUM(CASE WHEN review_count IS NULL THEN 1 ELSE 0 END) AS col3_nulls,
  SUM(CASE WHEN yelping_since IS NULL THEN 1 ELSE 0 END) AS col4_nulls,
  SUM(CASE WHEN useful IS NULL THEN 1 ELSE 0 END) AS col5_nulls,
  SUM(CASE WHEN funny IS NULL THEN 1 ELSE 0 END) AS col6_nulls,
  SUM(CASE WHEN cool IS NULL THEN 1 ELSE 0 END) AS col7_nulls,
  SUM(CASE WHEN elite IS NULL THEN 1 ELSE 0 END) AS col8_nulls,
  SUM(CASE WHEN friends IS NULL THEN 1 ELSE 0 END) AS col9_nulls,
  SUM(CASE WHEN fans IS NULL THEN 1 ELSE 0 END) AS col10_nulls,
  SUM(CASE WHEN average_stars IS NULL THEN 1 ELSE 0 END) AS col11_nulls
FROM
  user_raw;
  
  
  --- check the text column in reviews 2019 for duplicates - we have 1,852
SELECT text, COUNT(*) as count
FROM review_2019
GROUP BY text
HAVING COUNT(*) > 1;


-- now let's check the whole rows to see what's going on
SELECT *
FROM review_2019
WHERE text IN (
  SELECT text
  FROM review_2019
  GROUP BY text
  HAVING COUNT(*) > 1
);

-- dropping all duplicated text values and save result to new table
CREATE TABLE review_2019_clean AS
SELECT *
FROM review_2019
WHERE text IN (
  SELECT text
  FROM review_2019
  GROUP BY text
  HAVING COUNT(*) = 1
);



