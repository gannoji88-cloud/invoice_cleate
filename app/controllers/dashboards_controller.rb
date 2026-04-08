class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    # 直近の5件だけを取得して表示用にする
    @recent_sales = current_user.sales_orders.includes(:client).order(order_date: :desc).limit(5)
  end
end
