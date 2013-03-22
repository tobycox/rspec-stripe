require 'stripe'

class MyApp
	def initialize
		Stripe.api_key = 'test_key'
	end

	def create_customer
		customer = Stripe::Customer.create( :description => 'Test Customer') 
		customer
	end
end
