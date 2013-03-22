require 'stripe'

class MyApp
	def initialize
		Stripe.api_key = 'sk_test_PSh0iSsqsZ6R8WqL5e3GRdJP'
	end

	def create_customer
		customer = Stripe::Customer.create( :description => 'Test Customer') 
		customer
	end
end
