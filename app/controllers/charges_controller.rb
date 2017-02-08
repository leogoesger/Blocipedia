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
     description: "BigMoney Membership - #{current_user.email}",
     currency: 'usd'
   )
 
   User.find(current_user.id).role = 'premium'
   flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again. #{current_user.role}"
   redirect_to wikiis_path # or wherever
 
   # Stripe will send back CardErrors, with friendly messages
   # when something goes wrong.
   # This `rescue block` catches and displays those errors.
   rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to new_charge_path
 end
end
