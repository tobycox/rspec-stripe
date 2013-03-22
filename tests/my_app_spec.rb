#require_relative 'stripe_mocks_helper.rb'
require_relative 'my_app.rb'
require_relative '../lib/stripe_mocks_helper.rb'

describe MyApp do

	before :each do
		StripeMocksHelper.mock_customer
		@app = MyApp.new
	end

	it "should be able to mock a method" do 
		customer = @app.create_customer
		customer.should be_kind_of(Stripe::Mock::Customer)

		customer.object.should == 'customer' 
	end
end
