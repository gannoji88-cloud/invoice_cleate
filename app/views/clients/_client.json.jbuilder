json.extract! client, :id, :name, :manager_name, :email, :address, :user_id, :created_at, :updated_at
json.url client_url(client, format: :json)
