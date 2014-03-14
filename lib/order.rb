class Order
  attr_reader :food_qty, :total
  def initialize(food_qty, total)
    @food_qty = food_qty
    @total = total
  end
end