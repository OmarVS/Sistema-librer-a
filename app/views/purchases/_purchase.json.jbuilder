json.extract! purchase, :id, :product_barcode, :provider_rut, :amount, :price, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)