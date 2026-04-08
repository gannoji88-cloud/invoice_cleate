json.extract! sales_order, :id, :order_date, :client_id, :total_amount, :user_id, :created_at, :updated_at
json.url sales_order_url(sales_order, format: :json)
