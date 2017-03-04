json.extract! sale, :id, :product_barcode, :provider_rut, :amount, :price, :created_at, :updated_at
json.url sale_url(sale, format: :json)