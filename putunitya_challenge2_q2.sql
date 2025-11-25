SELECT
  jakarta_booking_created_date,
  COUNTIF(status_id = 3 AND cbv_amount BETWEEN 0 AND 10000) AS low_cbv,
  COUNTIF(status_id = 3 AND cbv_amount BETWEEN 10001 AND 20000) AS medium_cbv,
  COUNTIF(status_id = 3 AND cbv_amount > 20000) AS high_cbv,
FROM `putu-nitya-growth-test-goto.growth_challenge_2.challenge2_daily_booking`
GROUP BY jakarta_booking_created_date
ORDER BY jakarta_booking_created_date;