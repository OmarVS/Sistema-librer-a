# == Schema Information
#
# Table name: purchases
#
#  id         :integer          not null, primary key
#  name       :string
#  amount     :integer
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Purchase < ActiveRecord::Base
  belongs_to :book
  belongs_to :provider
end
