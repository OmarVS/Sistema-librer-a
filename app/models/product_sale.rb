class ProductSale < ActiveRecord::Base
  belongs_to :sale
  has_one :product
  accepts_nested_attributes_for :product, :allow_destroy => true
	validate :product_barcode_null
  validates :amount, length: {in: 1..2, message: "Cantidad entre 1 y 99"}
  validate :amount_positivo

  private
  def product_barcode_null
    @product = Product.find_by_barcode(product_barcode)
    if @product.nil?
      @product = Book.find_by_barcode(product_barcode)
    end
    if @product.nil?
      errors.add :product_barcode, "Producto no registrado"
    else
      self.price = @product.price
    end
  end

  def amount_positivo
    errors.add :amount, "Cantidad mínima 1" if self.amount == 0 || self.amount.to_s.include?("-")
    errors.add :amount, "Stock disponible: #{@product.stock}" if !@product.nil? && @product.stock < self.amount
  end

  def barcode_positivo
		errors.add :product_barcode, 'Ingrese sólo números' if self.product_barcode.to_s.include?("-")
	end
end
