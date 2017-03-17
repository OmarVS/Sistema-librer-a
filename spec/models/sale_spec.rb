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

require 'rails_helper'

RSpec.describe Sale, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
