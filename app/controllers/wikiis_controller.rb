class WikiisController < ApplicationController
  before_action :require_sign_in, except: [:index, :show, :destroy]
  def index
  	@wikiis = Wikii.all
  end

  def show
  	@wikii = Wikii.find(params[:id])
  end

  def new
  	@wikii = Wikii.new
  end

  def create
     @wikii = Wikii.new
     @wikii.user_id = current_user.id
     @wikii.title = params[:wikii][:title]
     @wikii.body = params[:wikii][:body]
     @wikii.private = params[:wikii][:private]

     if @wikii.save
       flash[:notice] = "Wiki was saved."
       redirect_to @wikii, notice: "Wikii was saved successfully."
     else
       flash.now[:alert] = "There was an error saving the Wikii. Please try again."
       render :new
     end
  end

  def update
     @wikii = Wikii.new
     @wikii.user_id = current_user.id
     @wikii.title = params[:wikii][:title]
     @wikii.body = params[:wikii][:body]
     @wikii.private = params[:wikii][:private]

     if @wikii.save
       flash[:notice] = "Wiki was updated."
       redirect_to @wikii, notice: "Wikii was updated successfully."
     else
       flash.now[:alert] = "There was an error updating the Wikii. Please try again."
       render :new
     end
  end

  def edit
  	@wikii = Wikii.find(params[:id])
  end

  def destroy
	  @wikii = Wikii.find(params[:id])

    if @wikii.destroy
		flash[:notice] = "\"#{@wikii.title}\" was deleted successfully."
		redirect_to action: :index
    else
		flash.now[:alert] = "There was an error deleting the topic."
		render :show
    end
  end
end
