class ApplicationController < ActionController::Base
  protected
  def authenticate_manager!
    if manager_signed_in?
      super
    else
      redirect_to new_manager_session_path
    end
  end
end
