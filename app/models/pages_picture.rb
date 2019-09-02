# == Schema Information
#
# Table name: pages_pictures
#
#  id                   :integer          not null, primary key
#  page_id              :integer
#  title                :string
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class PagesPicture < ApplicationRecord
end
