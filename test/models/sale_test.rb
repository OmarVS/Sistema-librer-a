# == Schema Information
#
# Table name: sales
#
#  id              :integer          not null, primary key
#  product_barcode :integer
#  provider_rut    :integer
#  amount          :integer
#  price           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#

require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
