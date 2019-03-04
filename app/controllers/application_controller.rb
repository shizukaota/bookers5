class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?




  def after_sign_up_path_for(resource)
    book_path
  end


  def after_logout_path_for(resource)
    about_path
  end
  def after_sign_in_path_for(resouces)
    books_path

  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  def set_current_user
  @current_user = User.find_by(id: [:user_id])
  end

end

