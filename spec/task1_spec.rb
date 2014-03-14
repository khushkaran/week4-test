require "task1"

describe Task1 do
  it "should be able to inject into an array" do
    array = Array.new(3) { |i| i } #=> [0,1,2]
    array2 = Task1.new(3) { |i| i }
    expect(array2.crazy_inject{|sum, i| sum + i}).to eq(array.inject{|sum, i| sum + i})
  end
end