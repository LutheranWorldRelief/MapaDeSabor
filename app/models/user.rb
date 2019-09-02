# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  active                 :boolean          default(TRUE)
#  name                   :string
#  lastname               :string
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login

  validates :email, uniqueness: true

  validates :password,
            presence: true,
            confirmation: true,
            on: :create

  validates :password,
            presence: true,
            confirmation: true,
            if: proc { |o| o.password.present? },
            on: :update


  def full_name
    [name, lastname].join(' ')
  end

  enum role: [:admin]

end
