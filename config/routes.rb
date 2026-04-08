Rails.application.routes.draw do
  # 1. ユーザー認証関連 (Devise)
  devise_for :users

  # 2. 顧客・商品・注文管理
  resources :clients
  resources :items

  # 3. 請求書（注文）とプレビュー機能
  resources :sales_orders do
    member do
      get :preview # /sales_orders/:id/preview というURLを作成
    end
  end

  # 4. ダッシュボードとトップページ設定
  # ログイン後のリダイレクト先やトップページに設定
  root 'dashboards#index'
  # 個別のパスを設定
  get 'dashboard', to: 'dashboards#index'

  # 5. システム用（正常稼働確認）
  get "up" => "rails/health#show", as: :rails_health_check
end