
-- Customer Purchase Analysis
-- Business question: How frequently do customers purchase?

SELECT
    COUNT(DISTINCT c.customer_unique_id) AS total_customers,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(
        COUNT(DISTINCT o.order_id) * 1.0
        / COUNT(DISTINCT c.customer_unique_id),
        2
    ) AS orders_per_customer,
    ROUND(
        SUM(oi.price) / COUNT(DISTINCT c.customer_unique_id),
        2
    ) AS revenue_per_customer
FROM raw_olist_customers_dataset AS c
JOIN raw_olist_orders_dataset AS o
    ON c.customer_id = o.customer_id
JOIN raw_olist_order_items_dataset AS oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered';
