class ChargesController < ApplicationController
  before_action :require_sign_in
  
  def new
  	@value = Amount.new
  	@stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "BigMoney Membership - #{current_user.name}",
     amount: @value.default
    }
  end

  def create
  	@value = Amount.new
   # Creates a Stripe Customer object, for associating
   # with the charge
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )
 
   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: @value.default,
     description: "Wiki Membership - #{current_user.name}",
     currency: 'usd'
   )
 
   User.find(current_user.id).premium!
   flash[:notice] = "Thanks for the money, #{current_user.email}!}"
   redirect_to wikiis_path 


   rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to new_charge_path
 end

 def downgrade
    @user = User.find(current_user.id)
    @user.standard!
    @wikis = @user.wikiis
    @wikis.each do |wiki|
      wiki.private = false
      wiki.save!
    end

    flash[:alert] = "Your suscription has been cancelled!"
    redirect_to wikiis_path
 end
end
