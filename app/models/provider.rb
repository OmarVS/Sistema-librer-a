# == Schema Information
#
# Table name: providers
#
#  id         :integer          not null, primary key
#  name       :string
#  rut        :string
#  business   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Provider < ActiveRecord::Base
  has_many :purchases
  has_many :products
  validates_uniqueness_of :rut, :message => "Ya está registrado"
  validates :name, length: {in: 4..30}
  validates :rut, rut: true
  validates :business, length: {in: 4..50}
end
