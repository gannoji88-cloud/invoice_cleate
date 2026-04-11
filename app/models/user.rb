class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :sales_orders, dependent: :destroy
  has_many :clients, dependent: :destroy
  has_many :items, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #has_secure_password
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # メールアドレスの正規表現バリデーション
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }
end