class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # minimum of 8 characters, at least 1 uppercase letter, 1 lowercase letter, 1 number and 1 special character
  PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[[:^alnum:]])/x
  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX }
  validates :password,
            presence: true,
            length: { minimum: 6 },
            format: { with: PASSWORD_REGEX }
  validates :nickname, presence: true, length: { minimum: 2, maximum: 20 }, uniqueness: true
end
