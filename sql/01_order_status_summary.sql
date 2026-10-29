
SELECT
    o.order_status,
    COUNT(DISTINCT o.order_id) AS order_count,
    ROUND(SUM(oi.price), 2) AS product_revenue,
    ROUND(SUM(oi.freight_value), 2) AS freight_revenue,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS total_order_value
FROM raw_olist_orders_dataset AS o
LEFT JOIN raw_olist_order_items_dataset AS oi
    ON o.order_id = oi.order_id
GROUP BY
    o.order_status
ORDER BY
    total_order_value DESC;
