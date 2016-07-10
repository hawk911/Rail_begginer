class Users::RegistrationsController < Devise::RegistrationsController
  # Override the action you want here.

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:name,:surname,
                                                              :email, :password, :password_confirmation)}
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:name,:surname,
                                                              :email, :password, :password_confirmation)}
  end
end
