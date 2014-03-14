require 'order'

describe Order do
  it "can be initialised with food, qty and total" do
    order = Order.new({:burrito => 2, :pasta => 3}, 28)
    expect(order.food_qty).to eq({:burrito => 2, :pasta => 3})
    expect(order.total).to eq(28)
  end
end