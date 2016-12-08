json.extract! sale, :id, :amount, :subtotal, :created_at, :updated_at
json.url sale_url(sale, format: :json)