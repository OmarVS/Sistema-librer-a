# == Schema Information
#
# Table name: products
#
#  id                  :integer          not null, primary key
#  name                :string
#  price               :integer
#  trademark           :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  stock               :integer          default("0")
#  barcode             :integer
#

class Product < ActiveRecord::Base
	attr_readonly :barcode, :on => :update
	validates_uniqueness_of :barcode, :message => 'Ya está registrado'
	validates :barcode, presence: true, length: {in: 10..15}
	validate :barcode_positivo
	validates :name, presence: true, length: {in: 3..30}
	validates :price, presence: true, length: {maximum: 7}
	validate :price_mayor
	validates :trademark, presence: true

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "150x150#" }, :default_url => "/images/products/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	def paypal_form
		{name: name,sku: barcode, price: (price),currency:"USD",quantity: 1}
	end

	def barcode_positivo
		errors.add :barcode, 'Ingrese sólo números' if self.barcode.to_s.include?("-")
	end

	def price_mayor
		errors.add :price, "Precio mínimo $1" if self.price == 0 || self.price.to_s.include?("-")
	end
end
