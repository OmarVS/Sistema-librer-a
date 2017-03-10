# == Schema Information
#
# Table name: providers
#
#  id         :integer          not null, primary key
#  name       :string
#  rut        :integer
#  business   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Provider < ActiveRecord::Base
  has_many :purchases
  validates_uniqueness_of :rut, :message => "Ya está registrado"
  validates :name, presence: true, length: {in: 4..50}
  validates :rut, presence: true, length: {in: 8..10}
  validates :business, presence: true, length: {maximum: 50}
  validate :rut_positivo

  def rut_positivo
  	errors.add :rut, 'Ingrese sólo números' if self.rut.include?("-")
  end
end
