
SELECT
    COALESCE(
        t.product_category_name_english,
        p.product_category_name,
        'Unknown'
    ) AS product_category,
    COUNT(DISTINCT oi.order_id) AS delivered_orders,
    COUNT(*) AS order_items,
    ROUND(SUM(oi.price), 2) AS product_revenue,
    ROUND(SUM(oi.freight_value), 2) AS freight_charged
FROM raw_olist_order_items_dataset AS oi
JOIN raw_olist_orders_dataset AS o
    ON oi.order_id = o.order_id
JOIN raw_olist_products_dataset AS p
    ON oi.product_id = p.product_id
LEFT JOIN raw_product_category_name_translation AS t
    ON p.product_category_name = t.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY
    COALESCE(
        t.product_category_name_english,
        p.product_category_name,
        'Unknown'
    )
ORDER BY product_revenue DESC
LIMIT 15;
