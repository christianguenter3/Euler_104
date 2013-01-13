require_relative 'Euler_104'
require 'test/unit'

class TestFib < Test::Unit::TestCase
  TEST_FIB = {  1 => 1,
                2 => 1,
                3 => 2,
                4 => 3,
                5 => 5,
                6 => 8,
                7 => 13 }

  def test_fib
    TEST_FIB.each{|input,output| assert_equal(output,@fib.fib(input))}
  end

  def test_each
    assert_equal([1,1,2,3,5,8,13,21],@fib.each(8).to_a)
  end

  def test_each_with_block
    assert_equal(TEST_FIB,@fib.each(7) {|x|})
  end

  def setup
    @fib = Fibonacci.new
  end
end

class TestInt < Test::Unit::TestCase
  TEST_PAN = { 123 => true,
    124 => false,
    53421 => true,
    4341 => false }

  def test_pan
    TEST_PAN.each{|input,output| assert_equal(output,input.is_pan?)}
  end

  def test_first_pan
    assert_equal(true,98761234521346976987123.first_pan?)
    assert_equal(true,@fib.fib(2749).first_pan?)
  end

  def test_last_pan
    assert_equal(true, 3748897987109894809710978397123945678.last_pan?)
    assert_equal(true, @fib.fib(541).last_pan?)
  end

  def setup
    @fib = Fibonacci.new
  end
end

class TestFibNew < Test::Unit::TestCase

  TEST_FIB = [  [2,3],
                [3,4],
                [5,5],
                [8,6],
                [13,7] ]

  def test_next
    TEST_FIB.each{|output| assert_equal(output,@fib.next)}
  end

  def setup
    @fib = Fib_new.new
  end
end

class TestEuler104 < Test::Unit::TestCase
  def test_get_res_fib
    assert_equal(0,@euler104.get_res_fib)
  end

  def setup
    @euler104 = Euler104.new
  end
end