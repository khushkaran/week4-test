require 'takeaway'

describe Takeaway do
  let(:order){double :order,{:food_qty => {:burrito => 2, :pasta => 3}, :total => 28} }
  let(:takeaway){takeaway = Takeaway.new(order)}
  let(:time){Time.now + (60*60)}
  
  context "Function" do
    it "can initialize with an order" do
      expect(takeaway.order).to eq(order)
    end

    it "knows what has been ordered" do
      expect(takeaway.order.food_qty.keys).to eq([:burrito,:pasta])
    end

    it "can calculate the total" do
      expect(takeaway.total).to eq(28)
    end

    it "can create a message" do
      expect(takeaway.message).to eq("Thank you! Your order was placed and will be delivered before #{time.strftime("%H:%M")}")
    end

    it "will send the message if the total is correct" do
      expect(takeaway).to receive(:send_message)
      takeaway.check_before_send
    end

    it "will return an error if the total is incorrect" do
      order_incorrect = double :order,{:food_qty => {:burrito => 2, :pasta => 3}, :total => 21}
      takeaway_incorrect = Takeaway.new(order_incorrect)
      expect(lambda{takeaway_incorrect.check_before_send}).to raise_error
    end

    it "will return an error if the try ordering something we do not sell" do
      order_incorrect = double :order,{:food_qty => {:chips => 2, :sandwich => 3}, :total => 21}
      takeaway_incorrect = Takeaway.new(order_incorrect)
      expect(lambda{takeaway_incorrect.check_before_send}).to raise_error
    end
  end
end