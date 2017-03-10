class Purchase < ActiveRecord::Base

  validates :provider_rut, presence: true
  validate :provider_rut_null
  validates :product_barcode, presence: true
  validate :product_barcode_null
  validates :amount, presence: true, length: {maximum: 7}
  validate :amount_positivo
  validates :price, presence: true, length: {maximum: 7}
  validate :price_positivo
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
      errors.add :product_barcode, "Producto no registrado." if @product.nil?
    end

    def date_is_future?
        errors.add :created_at, "No se puede ingresar fechas futuras" if created_at.to_date > Time.now
    end

    def amount_positivo
      errors.add :amount, 'Ingrese sólo números' if self.amount.to_s.include?("-")
    end

    def price_positivo
      errors.add :price, 'Ingrese sólo números' if self.price.to_s.include?("-")
    end
end
