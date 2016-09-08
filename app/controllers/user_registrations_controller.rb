class UserRegistrationsController < Devise::RegistrationsController
	def create
		super # allows Devise::RegistrationsController's CreateACTION to fire, then executes this code.
		if @user.persisted?
			UserMailer.welcome(@user).deliver_now
		end		
	end
end