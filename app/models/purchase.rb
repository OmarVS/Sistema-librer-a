class Purchase < ActiveRecord::Base
  validate :provider_rut_null
  validate :product_barcode_null
  validates :provider_rut, presence: true
  validates :product_barcode, presence: true
  validates :amount, presence: true
  validates :price, presence: true

  private
    def provider_rut_null
      errors.add :provider_rut, 'No existe el proveedor' if Provider.find_or_create_by(rut: provider_rut).nil?
    end

    def product_barcode_null
      @product = Product.find_by_barcode(product_barcode)
      if @product.nil?
        Product.create(barcode: product_barcode,stock: amount)
      else
        @product.stock = @product.stock + amount
        errors.add :product_barcode, "Primero complete los datos de este producto" if !@product.save
      end
    end
end
