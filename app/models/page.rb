# == Schema Information
#
# Table name: pages
#
#  id            :integer          not null, primary key
#  title         :string
#  objective     :text
#  general       :text
#  description   :text
#  youtube_url   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  objective_eng :text
#  general_eng   :text
#

class Page < ApplicationRecord

  has_many :pages_pictures, dependent: :destroy
  accepts_nested_attributes_for :pages_pictures, allow_destroy: true

  validates :youtube_url,
            format: URI.regexp(%w(http https)),
            unless: proc { |o| o.youtube_url.blank? }


end
