class CollaboratorsController < ApplicationController
  before_action :require_sign_in

  def create
    @user_name = params[:collaborator][:UserName]
    @user = User.find_by_name(@user_name)
    @wikii = Wikii.find(params[:id])
    @collaborator = Collaborator.new
    @collaborator.user_id = @user.id
    @collaborator.wikii_id = @wikii.id
  	
  	if @collaborator.save
       flash[:notice] = "Collaborator Saved! #{@user.email}, #{@wikii.title}"
    else
       flash[:alert] = "Adding Collaborator Failed!"
    end
 
     redirect_to wikii_url(@wikii)
  end

  def destroy
  end
end