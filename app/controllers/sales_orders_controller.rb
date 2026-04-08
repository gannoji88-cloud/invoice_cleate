class SalesOrdersController < ApplicationController
  before_action :authenticate_user!
  # show, edit, update, destroy の前にデータを取得する設定
  before_action :set_sales_order, only: %i[ show edit update destroy ]

  def index
    # .includes(:client) を追加することで、顧客データも効率よく読み込みます
    @sales_orders = current_user.sales_orders.includes(:client).order(order_date: :desc)
  end

  def show
  end

  def new
    @sales_order = current_user.sales_orders.build
  end

  def edit
  end

  def create
    @sales_order = current_user.sales_orders.build(sales_order_params)

    if @sales_order.save
      redirect_to sales_orders_path, notice: "売上伝票を登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @sales_order.update(sales_order_params)
      redirect_to sales_orders_path, notice: "売上伝票を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sales_order.destroy!
    redirect_to sales_orders_path, notice: "売上伝票を削除しました。", status: :see_other
  end

  def preview
    @sales_order = current_user.sales_orders.find(params[:id])
  end

  private

  # 共通のデータ取得処理（自分のデータしか触れないように制限）
  def set_sales_order
    @sales_order = current_user.sales_orders.find(params[:id])
  end

  # 許可するパラメーター（user_idは自動で紐づくので含めなくてOK）
  def sales_order_params
    params.require(:sales_order).permit(:order_date, :client_id, :total_amount)
  end
end