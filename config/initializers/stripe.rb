if Rails.env.production?
	Rails.configuration.stripe = {
		:publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
		:secret_key => ENV['STRIPE_SECRET_KEY']
	}
else
	Rails.configuration.stripe = {
		:publishable_key => 'pk_test_qwUTyo2tYaUfXWWTBwXE3J7b',
		:secret_key => 'sk_test_OHlSZYdQIzFMtr3BqXT3KX3K'
	}
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]