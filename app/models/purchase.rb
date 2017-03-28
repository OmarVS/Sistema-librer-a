# == Schema Information
#
# Table name: purchases
#
#  id              :integer          not null, primary key
#  product_barcode :integer
#  provider_rut    :string
#  amount          :integer
#  price           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  product_id      :integer
#

class Purchase < ActiveRecord::Base
  belongs_to :provider
  has_many :product_purchases, :dependent => :destroy
  accepts_nested_attributes_for :product_purchases, :allow_destroy => true
  validate :provider_rut_null
  validate :date_is_future?

  private
    def provider_rut_null
      errors.add :provider_rut, 'Proveedor no registrado' if Provider.find_by(rut: provider_rut).nil?
    end

    def date_is_future?
        errors.add :created_at, "No se puede ingresar fechas futuras" if created_at.to_date > Time.now
    end

end
