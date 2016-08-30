class StaticPagesController < ApplicationController

  def about
  end

  def contact
  end

  def landing_page
  	@products = Product.limit(3)
  end

  def sale_item
    @product_sale = Product.first
  end

  def thank_you
    @products = Product.where(price: "0".."500")
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end

end
