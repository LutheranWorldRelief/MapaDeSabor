# == Schema Information
#
# Table name: places
#
#  id                      :integer          not null, primary key
#  country_id              :integer
#  producer_id             :integer
#  name                    :string
#  long_name               :string
#  description             :string
#  latitude                :string
#  longitude               :string
#  content_left            :text
#  content_right           :text
#  main_image_file_name    :string
#  main_image_content_type :string
#  main_image_file_size    :integer
#  main_image_updated_at   :datetime
#  youtube_url             :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  x_axis                  :float
#  y_axis                  :float
#  fermentation_type       :integer
#  slug                    :string
#  quality_flavors         :text
#  harvest                 :text
#  scheme                  :text
#  flavor_id               :integer
#  description_eng         :text
#  quality_flavors_eng     :text
#  content_right_eng       :text
#  harvest_eng             :text
#  content_left_eng        :text
#  scheme_eng              :text
#

require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
