rspec-stripe
============

Provides some rspec helper methods for testing Stripe without hitting the Stripe API.

Handling Webhooks
------------

Your webhook handling code should authenticate a webhook request by retrieving the Event object from Stripe. 
This can be a little cumbersome when testing your webhook handling code, as you can end up having to create a JSON fixture for the webhook JSON as well as a matching Stripe::Event mock object.

This gem contains JSON fixtures for common Stripe events (these are yet to be fully populated) and automatically returns a mock Stripe::Event object.

For example:

    RspecStripeWebhookHelper.new.handle('charge.failed') { |body|
		  # Your test code here
    }

Will load a JSON fixture for the `charge.failed` webhook and will provide it to the block as the `body` parameter.
It will also stub the `Stripe::Event.retrieve` method and return a Stripe::Event mock object that matches the JSON in `body`. The stub is only applied within the scope of the block.
