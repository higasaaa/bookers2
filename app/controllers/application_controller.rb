class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

# flash massage
  add_flash_types :success, :info, :warnind, :danger

  # サインアウト,サインイン後にどこに遷移するかを設定するメソッド


  def after_sign_in_path_for(resource)
    user_path(current_user.id)
    #showに飛びたい
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:email])
  end
end










# configure_permitted_parametersメソッドでは、devise_parameter_sanitizer.permitメソッドを使うことで
# ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可しています。
# 先ほど述べたように、これはストロングパラメータと同様の機能です。
# privateは記述をしたコントローラ内でしか参照できません。
# 一方、protectedは呼び出された他のコントローラからも参照することができます。