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
      success_url: 'https://stripe-api-demo-app.herokuapp.com/',
      cancel_url: 'https://stripe-api-demo-app.herokuapp.com/',
    })

    respond_to do |format|
      format.js
    end
  end
end
