class StaticPagesController < ApplicationController

  def about
  end

  def contact
  end

  def landing_page
  	@products = Product.limit(3)
  end

  def sale_item
    @product = Product.all
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
    @products = Product.where(price: "0".."500")
  end

end
