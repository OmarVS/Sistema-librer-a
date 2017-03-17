class ProductPurchase < ActiveRecord::Base
  belongs_to :purchase
  has_one :product
  accepts_nested_attributes_for :product, :allow_destroy => true
  validate :product_barcode_null
  validates :amount, length: {in: 1..4, message: "Cantidad entre 1 y 9999"}
  validate :amount_positivo
  validates :price, length: {in: 1..6, message: "Precio entre 1 y 999999"}
  validate :price_mayor

  private
  def product_barcode_null
    @product = Product.find_by_barcode(product_barcode)
    if @product.nil?
      @product = Book.find_by_barcode(product_barcode)
    end
    if @product.nil?
      errors.add :product_barcode, "Producto no registrado"
    end
  end

  def amount_positivo
    errors.add :amount, "Cantidad mínima 1" if self.amount == 0 || self.amount.to_s.include?("-")
  end

  def price_mayor
    errors.add :price, "El precio debe ser mínimo $1" if self.price == 0 || self.price.to_s.include?("-")
  end
end
