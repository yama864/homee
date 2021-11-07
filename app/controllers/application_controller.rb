class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def update
    
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :relation_id])
    devise_parameter_sanitizer.permit(:accept_invitation,
                                      keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :relation_id])
  end
end
