NOTE: There is only one main commit - see Issues

Week 4 Test
---
End of week 4 test @makersacademy set by @antonydenyer required
us to re-implement the inject method. Also, we were required
to develop a Takeaway system that allowed an order to be
passed in, check the total it received, and then using the
Twilio API send a text message to the customer.

### Technologies
* Ruby
* Git
* Object-oriented-programming
* Test-driven-development with RSpec
* Twilio API
* RSpec Stubs and Doubles

### Instructions
To run the re-implementation of the inject method, run `irb`:

```ruby
require "./lib/task1"
=> true
array = Task1.new(3) { |i| i }
=> [0, 1, 2]
array.crazy_inject{|sum, i| sum + i}
=> 3
```

To run the takeaway run `irb`:

```ruby
require "./lib/takeaway"
=> true
require "./lib/order"
=> true
checkout = Checkout.new([:a, :b, :b, :c])
=> #<Checkout:0x007f96f11e4e68 @basket=[:a, :b, :b, :c]>
checkout.total
=> 115
order = Order.new({:burrito => 2, :pasta => 3}, 28)
 => #<Order:0x007f859ba7f558 @food_qty={:burrito=>2, :pasta=>3}, @total=28>
takeaway = Takeaway.new(order)
 => #<Takeaway:0x007f859ba86d08 @order=#<Order:0x007f859ba7f558 @food_qty={:burrito=>2, :pasta=>3}, @total=28>>
takeaway.total_correct?
=> true
takeaway.message
=> "Thank you! Your order was placed and will be delivered before 07:54"
takeaway.check_before_send
=> ...
```

### Issues
During development, I included my secret keys in the actual
code, which is a problem. Aiming to extract to a YAML and
rebase the code, I was unable to and deleted the git history.
That is why there is only one commit.
