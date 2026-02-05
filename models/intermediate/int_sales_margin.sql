SELECT
*
    ,quantity * purchase_price AS purchase_cost
    ,round(revenue - (quantity * purchase_price),2) AS margin
FROM {{ ref('stg_gz_raw_data__sales') }}
LEFT JOIN {{ ref('stg_gz_raw_data__product') }} USING(products_id)