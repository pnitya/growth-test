SELECT
  jakarta_booking_created_date,
  count(distinct order_no) as daily_orders,
  count(distinct customer_id) as transacting_users,
  sum(cbv_amount) as total_cbv
FROM `putu-nitya-growth-test-goto.growth_challenge_2.challenge2_daily_booking`
WHERE status_id = 3
GROUP BY
  jakarta_booking_created_date
ORDER BY
  jakarta_booking_created_date;