--count the number of entries for each topic of topic modeling output
SELECT topic, count(*)
FROM bertopic_analysis_results_update_3
GROUP BY topic;

-- check nulls in the sentiment analysis output
SELECT *,
  CASE WHEN sentiment_label IS NULL THEN 1 ELSE 0 END
FROM
  bertopic_analysis_results_update_2;

--
CREATE TABLE null_sentiments AS 
SELECT *
FROM bertopic_analysis_results_update_2
WHERE sentiment_label IS NULL;

--
CREATE TABLE null_sentiments_2 AS 
SELECT *
FROM null_sentiments
WHERE sentiment_label IS NULL;


-- view top 5 topics per city
SELECT *
FROM (
    SELECT
        metro,
        topic,
        COUNT(*) AS frequency,
        ROW_NUMBER() OVER (
            PARTITION BY metro
            ORDER BY COUNT(*) DESC
        ) AS rn
    FROM
        final_table_2
    GROUP BY
        metro,
        topic
) sub
WHERE rn <= 7;

-- check indsutries distribution in the final_table_3
SELECT key_category, COUNT(*) AS count
FROM final_table_3
GROUP BY key_category;

-- check cities distribution in the final_table_3
SELECT metro, COUNT(*) AS count
FROM final_table_3
GROUP BY metro;

-- filter for topics with the most positive sentiment (based on prior analysis)
SELECT topic, COUNT(*) AS reviews_count, count (DISTINCT sentiment_label) AS unique_sentiment_labels
FROM FINAL_table_3
WHERE topic IN (93, 70, 65, 150, 71)
GROUP BY topic;

-- check the distribution of sentiment labels per topic
SELECT topic, COUNT(DISTINCT sentiment_label) AS unique_sentiment_labels,
    COUNT(*) AS total_rows,
    min(sentiment_label) AS sentiment
FROM FINAL_table_3
GROUP BY topic;

--
SELECT
  topic,
  sentiment_label,
  COUNT(*) AS count,
  ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY topic), 2) AS percentage
FROM
  final_table_3
GROUP BY
  topic, sentiment_label
ORDER BY
  topic, percentage DESC;