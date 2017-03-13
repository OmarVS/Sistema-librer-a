class Sale < ActiveRecord::Base
  belongs_to :user
  has_many :products
  validates :user_id, presence: true
  validate :product_barcode_null
  validates :amount, presence: true, length: {maximum: 7}
  validate :amount_positivo
  validate :date_is_future?

  private
    def product_barcode_null
      @product = Product.find_by_barcode(product_barcode)
      if @product.nil?
        @product = Book.find_by_barcode(product_barcode)
      end
      if @product.nil?
        errors.add :product_barcode, "Producto no registrado."
      else
        self.price = @product.price
      end
    end

    def amount_positivo
      errors.add :amount, "La cantidad debe ser mínimo 1" if self.amount == 0 || self.amount.to_s.include?("-")
      errors.add :amount, "Stock disponible: #{@product.stock}" if !@product.nil? && @product.stock < self.amount
    end

    def date_is_future?
        errors.add :created_at, "No se puede ingresar fechas futuras" if created_at.to_date > Time.now
    end
end
