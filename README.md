rspec-stripe
============

Provides some rspec helper methods for testing Stripe without hitting the Stripe API.

Handling Webhooks
------------

You can easily test webhook handling code with:

    RspecStripeWebhookHelper.new.handle('charge.failed') { |body|
		  # Your test code here
    }

This will load a JSON fixture for the `charge.failed` webhook and will provide it to the block as the `body` parameter.
It will also stub the `Stripe::Event.retrieve` method and return a Stripe::Event mock object that matches the JSON in `body`. The stub is only applied within the scope of the block.
