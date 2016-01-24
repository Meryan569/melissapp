class PaymentsController < ApplicationController

	def create
      @product = Product.find(params[:product_id])
      if user_signed_in?
        @user = current_user
      end

  		token = params[:stripeToken]
  		# Create the charge on Stripe's servers - this will charge the user's card
  		begin
    		charge = Stripe::Charge.create(
      			:amount => (@product.price * 100).to_i,
      			:currency => "usd",
      			:source => token,
      			:description => params[:stripeEmail]
    		)
  		rescue Stripe::CardError => e
    		# The card has been declined
  		end
	end
end
