class CheckoutController < ApplicationController
  def create
    product = Product.find(params[:id]) 
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        name: product.name,
        amount: product.price,
        currency: 'usd',
        quantity: 1
      }],
      mode: 'payment',
      success_url: 'https://www.google.com/',
      cancel_url: 'https://www.google.com/',
    })

    respond_to do |format|
      format.js
    end
  end
end
