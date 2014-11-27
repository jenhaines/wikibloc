class ChargesController < ApplicationController

  def new
  end


  def create
    @user = User.find_by :name => current_user.name

    @amount = 1500

    customer = Stripe::Customer.create(
    :email => 'example@stripe.com',
    :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
    )
    @user.role = "premium"
    @user.save!
    

    redirect_to edit_user_registration_path
    flash[:notice] = "Congratulations, you are a Premium Member!"


    # redirect_to root_path # or wherever

rescue Stripe::CardError => e
    flash[:error] = e.message
    


  end
end
