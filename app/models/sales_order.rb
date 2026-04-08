class SalesOrder < ApplicationRecord
  belongs_to :client
  belongs_to :user

  # 必須項目のチェック
  validates :order_date, presence: true
  validates :client_id, presence: true
  validates :total_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
