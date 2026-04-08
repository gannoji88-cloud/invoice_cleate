class ApplicationController < ActionController::Base
  #skip_before_action :verify_authenticity_token

  include ActionController::Cookies # APIモードの場合必要

  def authorize_request
    token = cookies.signed[:jwt]
    decoded = JsonWebToken.decode(token)
    if decoded
      @current_user = User.find(decoded[:user_id])
    else
      render json: { error: 'ログインしてください' }, status: :unauthorized
    end
  end
end