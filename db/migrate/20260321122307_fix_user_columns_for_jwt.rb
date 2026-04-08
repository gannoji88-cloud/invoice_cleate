class FixUserColumnsForJwt < ActiveRecord::Migration[7.0]
  def change
    # Deviseのカラム名を JWT用の password_digest に変更
    rename_column :users, :encrypted_password, :password_digest

    # 不要なDevise用カラムを削除（任意ですがスッキリします）
    remove_column :users, :reset_password_token, :string
    remove_column :users, :reset_password_sent_at, :datetime
    remove_column :users, :remember_created_at, :datetime
  end
end
