# == Schema Information
#
# Table name: contacts
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  email      :string
#  phone      :string
#  country    :string
#  subject    :string
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contact < ApplicationRecord
  validates :name, :email, :message, :country, presence: true

end
