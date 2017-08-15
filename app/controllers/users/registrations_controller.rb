class Users::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash=nil)
    hash[:uid] = User.create_unique_string
    super
  end

  #新規登録後に遷移する先を制御しているメソッド
  #Deviseから継承して「after_inactive_sign_up_path_for」を
  #継承して独自実装する
  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end
end
