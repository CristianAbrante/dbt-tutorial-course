with source as (
    select * from {{ source('thelook_ecommerce', 'products') }}
)

select
    -- IDs
	id AS product_id,

	-- Other columns
	cost,
	retail_price,
	department

from source