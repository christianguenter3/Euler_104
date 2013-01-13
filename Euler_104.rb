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
    return @fib[n] if @fib.include?(n)
    (3..n).each do |x|  
      @fib[x] = @fib[x-1] + @fib[x-2] 
    end
    return @fib[n]
  end  
end

class Fib_new
  def initialize
    @n1, @n2 = 1, 1
    @current = 0
    @index = 2
  end
  
  def next
    @current = @n1 + @n2
    @n1, @n2 = @current, @n1
    @index += 1
    return @current, @index  
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
  def get_res_fib
    fib = Fib_new.new
    while f = fib.next
      puts f[1] if f[1] % 10_000 == 0
      return f[1] if f[0].first_pan? && f[0].last_pan?
    end
    return false
  end  
end

