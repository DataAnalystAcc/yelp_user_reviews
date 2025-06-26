  
  
  -- connect reviews and users - how many users left reviews? - same as our users table
  SELECT COUNT (DISTINCT user_id)
  FROM review_raw 
  LEFT JOIN user_raw USING (user_id);
  

  -- connect reviews and businesses - how many businesses are included? - same as our businesses table
 SELECT COUNT (DISTINCT business_id)
  FROM review_raw 
  LEFT JOIN business_raw USING (business_id);
  
  
  -- remove the text of reviews from reviews

  CREATE TABLE review_no_text AS
  SELECT review_id,
  user_id,
  business_id,
  stars,
  useful,
  funny,
  cool,
  date
  FROM review_raw;
  
  
  -- calculate number of checkins per business
CREATE TABLE checkin_clean AS   
SELECT
  *,
  array_length(string_to_array(date, ','), 1) AS checkins_count
FROM checkin_raw;


-- define the metropolitan areas clusters (metro)
CREATE TABLE business_clean AS 
SELECT *,
    CASE
        WHEN state = 'AB' THEN 'Edmonton'
        WHEN state IN ('PA', 'NJ', 'DE') THEN 'Philadelphia'
        WHEN state = 'FL' THEN 'Tampa'
        WHEN state = 'TN' THEN 'Nashville'
        WHEN state = 'IN' THEN 'Indianapolis'
        WHEN state IN ('MO', 'IL') THEN 'St. Louis'
        WHEN state = 'LA' THEN 'New Orleans'
        WHEN state = 'AZ' THEN 'Tucson'
        WHEN state = 'NV' THEN 'Reno'
        WHEN state = 'CA' THEN 'Santa Barbara'  
        WHEN state = 'ID' THEN 'Boise'
        ELSE 'Other'
    END AS metro
FROM business_raw;

SELECT *
FROM review_no_text
LEFT JOIN business_clean USING (business_id);

-- create a table that shows the # of reviews per year and per metro area
DROP TABLE IF EXISTS metro_time_reviews;

CREATE TABLE metro_time_reviews AS 
SELECT 
    EXTRACT(YEAR FROM date)::INT AS year, 
    TO_CHAR(date, 'YYYY-MM') AS year_month,
    metro, 
    COUNT(*) AS reviews_count
FROM review_no_text
LEFT JOIN business_clean USING (business_id)
GROUP BY YEAR, year_month, metro
ORDER BY YEAR, year_month, metro;


-- create a table of reviews just for year 2019
CREATE TABLE review_2019 AS
SELECT *
FROM review_raw
WHERE EXTRACT(YEAR FROM date) = 2019;

-- merge reviews 2019 and business key categories
SELECT *
FROM review_2019
LEFT JOIN business_clean USING (business_id);


-- create a population table for 2019
CREATE TABLE population_2019 AS 
SELECT * 
FROM population_by_metro
WHERE "Year" = '2019';

SELECT * FROM population_2019;

-- add information for Edmonton
INSERT INTO population_2019 (metro, "Year", "Population")
VALUES ('Edmonton', '2019', 1418118);