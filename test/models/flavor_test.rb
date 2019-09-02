# == Schema Information
#
# Table name: flavors
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  flavor_type :string
#  color       :string
#  is_visible  :boolean          default(TRUE)
#  position_x  :string
#  position_y  :string
#  position_z  :string
#  order       :integer
#

require 'test_helper'

class FlavorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
