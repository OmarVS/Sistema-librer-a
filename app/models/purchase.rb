class Purchase < ActiveRecord::Base

  validate :provider_rut_null
  validate :product_barcode_null
  validates :provider_rut, presence: true
  validates :product_barcode, presence: true
  validates :amount, presence: true
  validates :price, presence: true
  validate :date_is_future?

  private
    def provider_rut_null
      errors.add :provider_rut, 'Proveedor no registado.' if Provider.find_by(rut: provider_rut).nil?
    end

    def product_barcode_null
      @product = Product.find_by_barcode(product_barcode)
      if @product.nil?
        @product = Book.find_by_barcode(product_barcode)
      end
      if !@product.nil?
        @product.stock = @product.stock + amount
        @product.save
      else
        errors.add :product_barcode, "Producto no registrado."
      end
    end

    def date_is_future?
        errors.add :created_at, "No se puede ingresar fechas futuras" if created_at.to_date > Time.now
    end
end
