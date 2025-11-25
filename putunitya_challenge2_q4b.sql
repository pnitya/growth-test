WITH user_with_last_two AS (
  SELECT
    customer_id,
    user_state,
    CAST(SUBSTR(CAST(customer_id AS STRING), -2) AS INT64) AS last_two
  FROM `putu-nitya-growth-test-goto.growth_challenge_2.user_state`
),
completed_booking AS (
  SELECT
    jakarta_booking_created_date,
    order_no,
    customer_id,
    cbv_amount
  FROM `putu-nitya-growth-test-goto.growth_challenge_2.challenge2_daily_booking`
  WHERE status_id = 3
),
joined AS (
  SELECT
    b.*,
    u.user_state,
    CASE
      WHEN u.last_two BETWEEN 0 AND 33 THEN 'control'
      WHEN u.last_two BETWEEN 34 AND 66 THEN 'treatment_a'
      ELSE 'treatment_b'
    END AS treatment_group
  FROM completed_booking b
  JOIN user_with_last_two u
    ON b.customer_id = u.customer_id
  WHERE u.user_state = 'New'
)
SELECT
  treatment_group,
  ROUND(AVG(cbv_amount), 2) AS avg_cbv
FROM joined
GROUP BY treatment_group
ORDER BY treatment_group;
