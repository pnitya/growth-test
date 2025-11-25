WITH user_with_last_two AS (
  SELECT
    customer_id,
    user_state,
    CAST(SUBSTR(CAST(customer_id AS STRING), -2) AS INT64) AS last_two
  FROM `putu-nitya-growth-test-goto.growth_challenge_2.user_state`
)
SELECT
  user_state,
  CASE
    WHEN last_two BETWEEN 0 AND 33 THEN 'control'
    WHEN last_two BETWEEN 34 AND 66 THEN 'treatment_a'
    ELSE 'treatment_b'
  END AS treatment_group,
  COUNT(DISTINCT customer_id) AS user_count
FROM user_with_last_two
GROUP BY
  user_state, treatment_group
ORDER BY
  user_state, treatment_group;
