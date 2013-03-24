require_relative 'my_app.rb'
require_relative '../lib/stripe_mocks_helper.rb'

describe StripeMocksHelper do
	it "should set up the mock correctly for requests within the block" do
		helper = StripeMocksHelper.new('webhooks')
		helper.field_webhook 'invoice.created' do |body| 
			e = Stripe::Event.retrieve		
			e.should_not be_nil
			e.id.should_not be_nil
			e.id.should == body["id"]
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
