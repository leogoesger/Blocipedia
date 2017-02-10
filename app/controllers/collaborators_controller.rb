class CollaboratorsController < ApplicationController
  before_action :require_sign_in

  def create
  	@user_name = params[:collaborator][:UserName]
  	@user_id = User.where("name = ? ", @user_name)
  	@wikii = params[:pp]
  	collaborator = Collaborator.new
  	
  	if collaborator.save
       flash[:notice] = "Collaborator Saved!"
     else
       flash[:alert] = "Adding Collaborator Failed!"
     end
 
     redirect_to root
  end

  def destroy
  end
end