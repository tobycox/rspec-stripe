require 'rspec'
require 'stripe'
require 'stripe/mock/event'
require 'json'

class RspecStripeHelper
	
	def field_webhook(name, params = {})
		params = webhook_body name, params		
		setup_mock name, params
		yield params if block_given?
		# TODO: Remove mock
	end

	def webhook_body(name, params)
		path = File.join(File.dirname(__FILE__), 'fixtures', "#{name}.json")
		raise ArgumentError, "No fixture for that webhook: #{path}" unless File.exists? path
		fix = JSON.parse(IO.read(path))
		fix.merge! params
	end

	def setup_mock(name, params)
		mock = Stripe::Mock::Event.new params
		Stripe::Event.stub(:retrieve) { mock }
	end
end
