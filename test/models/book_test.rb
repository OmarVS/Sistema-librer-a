# == Schema Information
#
# Table name: books
#
#  id                  :integer          not null, primary key
#  name                :string
#  price               :integer
#  writer              :string
#  editorial           :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  genre_id            :integer
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  stock               :integer          default("0")
#  barcode             :integer
#

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
