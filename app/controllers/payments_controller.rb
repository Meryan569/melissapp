class PaymentsController < ApplicationController

	def create
      @product = Product.find(params[:product_id])
      @user = current_user
      token = params[:stripeToken]
  		
  		begin
    		charge = Stripe::Charge.create(
      			:amount => (@product.price * 100).to_i,
      			:currency => "usd",
      			:source => token,
      			:description => @product.name + " product purchased by " + params[:stripeEmail]
    		)
        if charge.paid
          Order.create(
            user_id: @user.id,
            product_id: @product.id,
            total: @product.price.to_d / 100
            )
          UserMailer.payment_confirmation(@user).deliver_now
        end
  		rescue Stripe::CardError => e
        # The card has been declined
        body = e.json_body
        err = body[:error]
        flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
      
        redirect_to product_path(@product)
      end
	end
end
