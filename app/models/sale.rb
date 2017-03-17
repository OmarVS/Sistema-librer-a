# == Schema Information
#
# Table name: sales
#
#  id              :integer          not null, primary key
#  product_barcode :integer
#  provider_rut    :integer
#  amount          :integer
#  price           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#

class Sale < ActiveRecord::Base
  belongs_to :user
  has_many :product_sales, :dependent => :destroy
  accepts_nested_attributes_for :product_sales, :allow_destroy => true
  validates :user_id, presence: true
  validate :date_is_future?
  validate :productos

  private
    def product_barcode_null
      @product = Product.find_by_barcode(product_barcode)
      if @product.nil?
        @product = Book.find_by_barcode(product_barcode)
      end
      if @product.nil?
        errors.add :barcode, "Producto no registrado."
      else
        self.price = @product.price
      end
    end

    def productos
      errors.add :user_id, "Debe ingresar mínimo un producto" if :product_sales.count==0
    end

    def date_is_future?
        errors.add :created_at, "No se puede ingresar fechas futuras" if created_at.to_date > Time.now
    end
end
