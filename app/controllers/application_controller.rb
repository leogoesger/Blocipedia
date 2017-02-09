class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  
  private
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

   def require_sign_in
     unless current_user
       flash[:alert] = "You must be logged in to do that"
       redirect_to new_user_session_path
     end
   end
end
