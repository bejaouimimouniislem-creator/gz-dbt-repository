SELECT 
    orders_id
    ,date_date
    ,revenue
    ,quantity
    ,shipping_fee
    ,purchase_cost
    ,logcost
    ,ship_cost
    ,margin
    ,ROUND(margin+shipping_fee-logcost-ship_cost,2) AS Operational_margin
FROM {{ ref('int_orders_margin') }}
LEFT JOIN {{ ref('stg_raw__ship') }} USING(orders_id)
ORDER BY orders_id DESC