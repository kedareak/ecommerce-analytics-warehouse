
SELECT
    DATE_TRUNC(
        'month',
        CAST(order_purchase_timestamp AS TIMESTAMP)
    ) AS purchase_month,
    COUNT(*) AS delivered_order_count,
    ROUND(
        AVG(
            DATE_DIFF(
                'day',
                CAST(order_purchase_timestamp AS TIMESTAMP),
                CAST(order_delivered_customer_date AS TIMESTAMP)
            )
        ),
        2
    ) AS average_delivery_days,
    ROUND(
        AVG(
            DATE_DIFF(
                'day',
                CAST(order_estimated_delivery_date AS TIMESTAMP),
                CAST(order_delivered_customer_date AS TIMESTAMP)
            )
        ),
        2
    ) AS avg_days_vs_estimate
FROM raw_olist_orders_dataset
WHERE order_status = 'delivered'
  AND order_purchase_timestamp IS NOT NULL
  AND order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL
GROUP BY 1
ORDER BY 1;
