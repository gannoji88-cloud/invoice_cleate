class ItemsController < ApplicationController
  before_action :authenticate_user!
  # show, edit, update, destroyを実行する前に@itemをセットする
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items
  def index
    @items = current_user.items.order(:name)
  end

  # GET /items/1
  def show
  end

  # GET /items/new
  def new
    @item = current_user.items.build
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to items_path, notice: "商品を登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      redirect_to items_path, notice: "商品を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy!
    redirect_to items_path, notice: "商品を削除しました。", status: :see_other
  end

  private

  # ログインユーザーに紐づくデータのみを取得（セキュリティ対策）
  def set_item
    @item = current_user.items.find(params[:id])
  end

  # 許可するパラメーター
  def item_params
    params.require(:item).permit(:name, :unit_price)
  end
end
