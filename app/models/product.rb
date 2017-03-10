# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  price       :integer
#  Description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ActiveRecord::Base
	attr_readonly :barcode, :on => :update
	belongs_to :user
	validates_uniqueness_of :barcode, :message => 'Ya está registrado'
	validates :barcode, presence: true, length: {in: 10..15}
	validate :barcode_positivo
	validates :name, presence: true, length: {in: 3..50}
	validates :price, presence: true, length: {maximum: 7}
	validates :trademark, presence: true

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "150x150#" }, :default_url => "/images/products/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	def barcode_positivo
		errors.add :barcode, 'Ingrese sólo números' if self.barcode.include?("-")
	end

end
