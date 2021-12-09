class Group < ApplicationRecord
  has_secure_password
  has_many :group_users
  has_many :users, through: :group_users
  has_many :comments
  has_many :events
  validates :group_name, presence: true
  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は英字と数字の両方を含めてください'
end