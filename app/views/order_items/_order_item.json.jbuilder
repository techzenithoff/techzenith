json.extract! order_item, :id, :uid, :order_id, :food_id, :quantity, :price, :amount, :created_at, :updated_at
json.url order_item_url(order_item, format: :json)
