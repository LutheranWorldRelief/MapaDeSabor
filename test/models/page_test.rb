# == Schema Information
#
# Table name: pages
#
#  id          :integer          not null, primary key
#  title       :string
#  objective   :text
#  general     :text
#  description :text
#  youtube_url :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
