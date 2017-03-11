class Purchase < ActiveRecord::Base

  validate :provider_rut_null
  validate :product_barcode_null
  validates :amount, presence: true, length: {maximum: 7}
  validate :amount_positivo
  validates :price, presence: true, length: {maximum: 7}
  validate :price_mayor
  validate :date_is_future?

  private
    def provider_rut_null
      errors.add :provider_rut, 'Proveedor no registado' if Provider.find_by(rut: provider_rut).nil?
    end

    def product_barcode_null
      @product = Product.find_by_barcode(product_barcode)
      if @product.nil?
        @product = Book.find_by_barcode(product_barcode)
      end
      errors.add :product_barcode, "Producto no registrado" if @product.nil?
    end

    def date_is_future?
        errors.add :created_at, "No se puede ingresar fechas futuras" if created_at.to_date > Time.now
    end

    def amount_positivo
      errors.add :amount, "La cantidad debe ser mínimo 1" if self.amount == 0 || self.amount.to_s.include?("-")
    end

    def price_mayor
  		errors.add :price, "El precio debe ser mínimo $1" if self.price == 0 || self.price.to_s.include?("-")
  	end
end
