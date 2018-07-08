class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :password_digest, presence: true
  validates :phone, presence: true, on: :create, unless: :oauth_login
  validates :email, presence: true, on: :create, uniqueness: true, unless: :oauth_login

  def oauth_login
    oauth_token.present?
  end
end
