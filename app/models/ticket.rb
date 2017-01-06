# == Schema Information
#
# Table name: tickets
#
#  id         :integer          not null, primary key
#  total      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ticket < ActiveRecord::Base
end
