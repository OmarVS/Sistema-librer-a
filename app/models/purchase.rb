class Purchase < ActiveRecord::Base
  validate :provider_rut_null
  validate :product_barcode_null
  validates :provider_rut, presence: true
  validates :product_barcode, presence: true
  validates :amount, presence: true
  validates :price, presence: true

  private
    def provider_rut_null
      errors.add :provider_rut, '. No existe el proveedor' if Provider.find_or_create_by(rut: provider_rut).nil?
    end

    def product_barcode_null
      erros.add :product_barcode, ' no está registrado.' if Product.find_or_create_by(barcode: product_barcode).nil?
    end
end
