module Enumerable
  # Your code goes here
  def my_all?
    result = true
    self.my_each {|elem| result = false unless yield elem}
    result
  end

  def my_any?
    result = false
    self.my_each {|elem| result = true if yield elem}
    result
  end

  def my_count
    counter = 0
    self.my_each do |elem|
      if block_given?
        counter += 1 if yield elem
      else
        counter += 1
      end
    end
    counter
  end

  def my_each_with_index
    index = 0
    self.my_each do |elem|
      yield(elem, index)
      index += 1
    end
  end

  def my_inject(initial = nil)
    accumulator = initial || self.first
    start = initial ? 0 : 1
    self[start..-1].my_each { |elem| accumulator = yield(accumulator, elem) }
    accumulator
  end

  def my_map
    result = []
    self.my_each { |elem| result.push(yield elem)}
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for elem in self
      yield elem
    end
  end
end
#rspec spec/my_each_spec.rb 
