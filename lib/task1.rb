class Task1 < Array
  def crazy_inject
    initial = 0
    self.each{|i|
      initial = yield(initial,i)
    }
    initial
  end
end