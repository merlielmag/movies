class ChargesController < ApplicationController

  before_action :authenticate_user!

  def new
    @pelicula = Pelicula.find(params[:id])
    @email = User.email
    @amount = @pelicula.precio
  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'eur'
    )
    flash[:success] = t('flash.payment')
    redirect_to settings_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
