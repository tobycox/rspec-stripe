module Stripe::Mock
  class Event
    ATTRIBUTES = [:id, :object, :livemode, :data, :pending_webhooks, :type]

    ATTRIBUTES.each do |attr|
      attr_accessor attr
    end  

    def initialize(args = {})
      ATTRIBUTES.each do |attr|
        value = args[attr].nil? ? args[attr.to_s] : args[attr]
        instance_variable_set("@#{attr}", value) unless value.nil?
      end
    end

  end
end
