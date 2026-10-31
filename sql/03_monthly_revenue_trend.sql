
-- Monthly Revenue Trend
-- Business question: How does revenue change over time?

SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS order_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(oi.order_item_id) AS total_items_sold,
    ROUND(SUM(oi.price), 2) AS monthly_revenue,
    ROUND(SUM(oi.freight_value), 2) AS freight_revenue
FROM raw_olist_orders_dataset AS o
JOIN raw_olist_order_items_dataset AS oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp)
ORDER BY order_month;
