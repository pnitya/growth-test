SELECT
x.user_state,
sum(y.cbv_amount) as total_cbv
FROM `putu-nitya-growth-test-goto.growth_challenge_2.challenge2_daily_booking` AS y
JOIN `putu-nitya-growth-test-goto.growth_challenge_2.user_state` AS x
  ON y.customer_id = x.customer_id
WHERE y.status_id = 3
GROUP BY x.user_state
ORDER BY x.user_state;