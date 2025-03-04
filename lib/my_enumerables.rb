module Enumerable
  # Your code goes here
  def my_all?
    result = true
    self.my_each {|elem| result = false unless yield elem}
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
