class ChargesController < ApplicationController

  def new
  end

  def cancel
    @user = User.find_by :name => current_user.name
    @user.role = "standard"
    @user.roledate = Time.now
    if @user.save
      flash[:notice] = "We're sorry you had to leave..Membership canceled."
      redirect_to edit_user_registration_path
    else
      flash[:error] = "There was an error with your transaction, please contact customer service."
    end
  end

  def update
    
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
    @user.roledate = Time.now
    if @user.save
      flash[:notice] = "Congratulations, you are a Premium Member!"
      redirect_to edit_user_registration_path
    else
      flash[:error] = "There was an error with your transaction, please contact customer service."
    end

rescue Stripe::CardError => e
    flash[:error] = e.message
  end
end
