# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Genre < ActiveRecord::Base
	has_many :books
	validates_uniqueness_of :name, :message => 'Ya está registrado'
	validates :name, presence: true, length: {minimum: 4}

end
