module Stripe::Mock
	class Customer
		attr_accessor :id, :object, :livemode, :created, :account_balance, :active_card, :delinquent, :description, :discount, :email, :subscription

		def initialize(attrs = {})
			attrs.merge! defaults
			self.id = attrs[:id]
			self.object = attrs[:object]
			# TODO The rest of the params
		end

		def defaults
			{ :object => 'customer' } 		
		end
	end
end
