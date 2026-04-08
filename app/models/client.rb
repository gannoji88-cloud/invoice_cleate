class Client < ApplicationRecord
  belongs_to :user
  has_many :sales_orders, dependent: :destroy
end
