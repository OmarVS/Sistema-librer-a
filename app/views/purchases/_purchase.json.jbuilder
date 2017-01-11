json.extract! purchase, :id, :product_id, :provider_id, :amount, :price, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)