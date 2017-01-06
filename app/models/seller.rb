# == Schema Information
#
# Table name: sellers
#
#  id         :integer          not null, primary key
#  name       :string
#  RUT        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Seller < ActiveRecord::Base
	belongs_to :user
end
