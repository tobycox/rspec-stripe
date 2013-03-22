module StripeMock
	module Stripe::Customer
		def extended(obj)
			Stripe::Customer.stub(:create) { StripeCustomerMock.new }
		end
	end
end
