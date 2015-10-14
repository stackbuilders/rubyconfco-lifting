require 'concurrent'
require 'httparty'

Concurrent::Promise.class_eval do
  def map
    send(:then)
  end

  alias_method :map, :then
end

plus_one = ->(n) { n + 1 }
minus_five = ->(n) { n - 5 }
plus_ten = ->(n) { n + 10 }

fulfilled_value =
  Concurrent::Promise.new { 5 }
  .map(&plus_one)
  .map(&minus_five)
  .map(&plus_ten)
  .execute

sleep(0.1)
fulfilled_value == 11

# 2.1.3 :001 > true
