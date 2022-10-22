class User < ApplicationRecord
	has_one_attached :avatar
	has_many :articles, dependent: :destroy

  has_secure_password
  validates :name, presence: true
  validates :address,presence: true
  validates :password_digest,presence: true
  validates :email,presence: true,uniqueness: true,
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            }
end
