require 'rspec'
require 'stripe'
require 'stripe/mock/event'
require 'json'

class RspecStripeWebhookHelper

  def self.handle(name, params = {})
    params = webhook_body name, params    
    add_webhook_stub params
    yield params if block_given?
    remove_webhook_stub  
  end

  private

  def self.webhook_body(name, params)
    path = File.join(File.dirname(__FILE__), 'fixtures', "#{name}.json")
    raise ArgumentError, "No fixture for that webhook: #{path}" unless File.exists? path
    fix = JSON.parse(IO.read(path))
    fix.merge! params
  end

  def self.add_webhook_stub(params)
    mock = Stripe::Mock::Event.new params
    Stripe::Event.stub(:retrieve) { mock }
  end
  
  def self.remove_webhook_stub
    Stripe::Event.unstub!(:retrieve) 
  end
end
