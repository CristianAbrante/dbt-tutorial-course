with products as (
    select
        product_id,
        department as product_department,
        retail_price as product_retail_price,
        cost as product_cost,
    from {{ ref('stg_ecommerce__products') }}
)

select
    -- IDs
    order_items.order_item_id,
    order_items.order_id,
    order_items.user_id,
    order_items.product_id,


    -- order items data
    order_items.item_sale_price,

    -- Product data
	products.product_department,
	products.product_cost,
	products.product_retail_price,

    -- calculated fields
    order_items.item_sale_price - products.product_cost as item_profit,
    products.product_retail_price - order_items.item_sale_price AS item_discount,


from {{ ref('stg_ecommerce__order_items') }} as order_items
left join products on products.product_id = order_items.product_id