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

require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
