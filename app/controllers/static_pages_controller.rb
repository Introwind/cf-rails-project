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

end
