with 

source as (

    select * from {{ source('gz_raw_data', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        
        logcost,
        cast(ship_cost,FLOAT64) AS ship_cost

    from source
   where shipping_fee <> shipping_fee_1
)

select * from renamed