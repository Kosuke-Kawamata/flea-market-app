# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

# afte_sign_in_for で､サインインした後に､homes_mypage_pathへ飛ばしている｡何も設定をしていなければ､自ずとroot_pathへと飛ばされる｡
  def after_sign_in_path_for(resource)
    root_path
  end
# afte_sign_out_for で､サインアウトした後に､root_pathへ飛ばしている
  def after_sign_out_path_for(resource)
    root_path
  end
end
