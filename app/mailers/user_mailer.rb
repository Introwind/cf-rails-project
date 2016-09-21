class UserMailer < ApplicationMailer
	before_action :set_name

	def contact_form(email, name, message)
		@message = message
		mail(:from => email,
			:to => "asim1204@gmail.com",
			:subject => "A new contact form message from #{name}")
	end

	def welcome(user)
		mail( :to => user.email,
			:subject => "Welcome to #{@appname}!")		
	end

	def purchase(user, product, price)
		@user = user
		@product = product.name
		@price = price
		mail(:from => "orders@bikestask.com",
			:to => user.email,
			:subject => "Order Confirmation from #{@appname}"
			)
		
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_name
      @appname = "Bike London"
    end

end