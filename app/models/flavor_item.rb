# == Schema Information
#
# Table name: flavor_items
#
#  id         :bigint(8)        not null, primary key
#  position_x :integer
#  position_y :integer
#  flavor_id  :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order      :integer
#

class FlavorItem < ApplicationRecord
  belongs_to :flavor
  validates :position_x, :position_y, presence: true
end
