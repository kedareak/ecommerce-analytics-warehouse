
-- Order Status Summary
-- Business question: What is the current distribution of order statuses?

SELECT
    order_status,
    COUNT(*) AS total_orders,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM raw_olist_orders_dataset),
        2
    ) AS percentage_of_orders
FROM raw_olist_orders_dataset
GROUP BY order_status
ORDER BY total_orders DESC;


