require_relative '../lib/rspec_stripe_webhook_helper.rb'

describe RspecStripeWebhookHelper do
  it "should set up the mock correctly for requests within the block" do
    RspecStripeWebhookHelper.handle 'invoice.created' do |body| 
      e = Stripe::Event.retrieve    
      e.should_not be_nil
      e.id.should_not be_nil
      e.id.should == body["id"]
    end
  end

  it "should override body parameters" do
    params = { :id => 1234, :data => { :test => '1234' } } 
    RspecStripeWebhookHelper.handle('invoice.created', params) do |body| 
      e = Stripe::Event.retrieve    
      e.id.should == params[:id]
      e.data[:test].should_not be_nil
      e.data[:test].should == params[:data][:test]
      e.id.should eq body[:id]
      e.data.should eq body[:data]
    end
  end
end

describe Stripe::Mock::Event do
  it "should correctly assign attributes from the hash" do
    params = {
      :id => "asdfadfasdfasdf",
      :object => 'test',
      :livemode => true,
      :data => {
        :test => 'testvalue'
      },
      :pending_webhooks => 123,
      :type => 'invoice.created'
    }

    e = Stripe::Mock::Event.new(params)
    e.id.should == params[:id]
    e.object.should == params[:object]
    e.livemode.should == params[:livemode]
    e.data.should == params[:data]
    e.pending_webhooks.should == params[:pending_webhooks]
    e.type.should == params[:type]
    
  end
end
