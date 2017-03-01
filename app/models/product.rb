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
	validates_uniqueness_of :barcode
	validates :barcode, :name, :price, :trademark, presence: true, :on => :update
	validates :barcode, presence: true, :on => :create
	belongs_to :user
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "150x150#" }, :default_url => "/images/products/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	private
		def total
			suma = 0
			products.each do |product|
				suma += product.price
				ene += product.price if product.created_at.to_date.month==1
				feb += product.price if product.created_at.to_date.month==2
				mar += product.price if product.created_at.to_date.month==3
				abr += product.price if product.created_at.to_date.month==4
				may += product.price if product.created_at.to_date.month==5
				jun += product.price if product.created_at.to_date.month==6
				jul += product.price if product.created_at.to_date.month==7
				ago += product.price if product.created_at.to_date.month==8
				sep += product.price if product.created_at.to_date.month==9
				oct += product.price if product.created_at.to_date.month==10
				nov += product.price if product.created_at.to_date.month==11
				dic += product.price if product.created_at.to_date.month==12
			end
		end

end
