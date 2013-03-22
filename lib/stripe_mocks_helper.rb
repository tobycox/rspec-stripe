require 'rspec'
require 'stripe'
require 'stripe/mock/customer'

class StripeMocksHelper
	def self.mock_customer
		Stripe::Customer.stub(:create) { Stripe::Mock::Customer.new }
	end
end
