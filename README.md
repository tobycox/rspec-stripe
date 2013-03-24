rspec-stripe
============

Provides some rspec helper methods for testing Stripe without hitting the Stripe API.

Handling Webhooks
------------

rspec-stripe allows you to quickly test common webhooks. 
Calling:

	RspecStripeWebhookHelper.new.handle('charge.failed', {}) { |body|
		# Your test code here
	}

will load a JSON fixture for the `charge.failed` webhook and will provide it to the block as the `body` parameter.
It will also stub the `Stripe::Event.retrieve` method and will return a Stripe::Event mock object that matches the JSON in `body`.
