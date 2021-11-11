class Group < ApplicationRecord
  has_secure_password
  has_many :group_users
  has_many :users, through: :group_users
  has_many :comments
  validates :group_name, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid'
end