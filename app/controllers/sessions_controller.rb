class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      # Cookieに保存する場合（セキュア設定）
      cookies.signed[:jwt] = { value: token, httponly: true, expires: 24.hours.from_now }
      render json: { message: 'ログイン成功' }, status: :ok
    else
      render json: { error: 'メールアドレスかパスワードが正しくありません' }, status: :unauthorized
    end
  end
end