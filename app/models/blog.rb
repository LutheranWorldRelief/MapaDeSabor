# == Schema Information
#
# Table name: blogs
#
#  id           :bigint(8)        not null, primary key
#  title        :string
#  body         :text
#  autor        :string
#  presentation :string
#  status       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Blog < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: :slugged
  mount_uploader :presentation, ImageUploader
  enum status: [:enable, :disable]
end
