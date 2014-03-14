require 'twilio-ruby'
require 'yaml'

CONFIG = YAML.load_file('./lib/config.yml') unless defined? CONFIG

MENU = {
  :burrito => 5,
  :quesadilla => 4,
  :pasta => 6,
  :nachos => 5,
  :taco => 4,
  :pizza => 6
}

class Takeaway

  attr_reader :order

  def initialize(order)
    @order = order
  end

  def total

    total = []
    order.food_qty.each{|food, qty|
      MENU[food] != nil ? total << MENU[food] * qty : (raise "We do not sell #{food} here")
    }
    total.inject{|sum,x| sum + x}
  end

  def message
    time = Time.now + (60*60)
    "Thank you! Your order was placed and will be delivered before #{time.strftime("%H:%M")}"
  end

  def total_correct?
    order.total == total
  end

  def check_before_send
    total_correct? ? send_message(message) : (raise "Incorrect total, order will not be placed")
  end

  def client
    Twilio::REST::Client.new "#{CONFIG['account_sid']}", "#{CONFIG['auth_token']}"
  end

  def send_message(message)
    client.account.sms.messages.create(:from => "#{CONFIG['twilio_number']}", :to => "#{CONFIG['my_number']}", :body => message)
  end

end