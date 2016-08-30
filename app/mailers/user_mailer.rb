class UserMailer < ApplicationMailer
  	default from: 'someone@bikestask.com'

	def contact_form(email, name, message)
		@message = message
			mail(:from => email,
				:to => "asim1204@gmail.com",
				:subject => "A new contact form message from #{name}")
	end
end
