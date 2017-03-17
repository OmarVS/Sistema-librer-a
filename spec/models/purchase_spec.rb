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

require 'rails_helper'

RSpec.describe Purchase, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
