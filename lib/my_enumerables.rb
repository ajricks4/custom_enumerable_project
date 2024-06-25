module Enumerable
  # Your code goes here
  def my_find
    self.each do |elem|
      return elem if yield(elem)
    end
    nil
  end

  def my_each_with_index 
    count = 0 
    self.each do |elem|
      yield(elem, count)
      count += 1 
    end 
  end 

  def my_select 
    selected = [] 
    self.each do |elem|
      selected << elem if yield(elem)
    end
    return selected 
  end

  def my_all?
    self.each do |elem|
      return false if yield(elem) == false 
    end
    return true 
  end

  def my_any? 
    self.each do |elem|
      return true if yield(elem)
    end
    return false 
  end

  def my_none?
    self.each do |elem|
      return false if yield(elem)
    end
    return true 
  end
  
  def my_count
    if !block_given?
      return self.length 
    end
    count = 0 
    self.each do |elem|
      count += 1 if yield(elem)
    end
    return count
  end

  def my_map 
    mapped = [] 
    self.each do |elem|
      mapped << yield(elem)
    end
    mapped 
  end

  def my_inject(initial)
    accum = initial 
    self.each do |elem|
      accum = yield(accum, elem)
    end
    accum 
  end



  
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each 
    self.each do |elem|
      yield(elem)
    end
  end
end
