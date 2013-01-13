class Fibonacci
  include Enumerable
  
  def initialize
    @fib = Hash.new(0)
    @fib[1], @fib[2] = 1, 1
  end
  
  def each(upto,&block)
    fib(upto)
    return @fib.to_a.map{|k,v| v} unless block
    @fib.each do |k,v|
      block.call(v)
    end
  end
  
  def fib(n)
    unless @fib.include?(n)
      @fib[n] = fib(n-1) + fib(n-2)
    end
    return @fib[n]
  end  
end

class Integer
  def is_pan?
    self.to_s.split(//).sort.join.to_s == (1..self.to_s.length).to_a.sort.join.to_s 
  end
  
  def first_pan?
    self.to_s[0..8].to_i.is_pan?
  end
  
  def last_pan?
    self.to_s[-9..-1].to_i.is_pan?
  end

end

class Euler104
 
  def initialize(max)
    @max = max
  end
  
  def get_res_fib
    fib = Fibonacci.new
    fib.each_with_index(@max) do |f,i|
      return i + 1 if f.first_pan? && f.last_pan?
    end
    return false
  end  
end

