# == Schema Information
#
# Table name: producers
#
#  id         :integer          not null, primary key
#  country_id :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Producer < ApplicationRecord

  belongs_to :country
  has_many :places

  validates :name, presence: true

end
