class Maybe
  ([:each] + Enumerable.instance_methods).each do |enumerable_method|
    define_method(enumerable_method) do |*args, &block|
    end
  end

  def to_ary
    __enumerable_value
  end
  alias_method :to_a, :to_ary
  alias_method :eql?, :==
end

# Represents a non-empty value
class Some < Maybe
  def initialize(value)
    @value = value
  end

  def method_missing(method_sym, *args, &block)
    map { |value| value.send(method_sym, *args, &block) }
  end

  private

  def __enumerable_value
  end
end

# Represents an empty value
class None < Maybe

  private

  def __enumerable_value
  end
end

# rubocop:disable MethodName
def Maybe(value)
  if value.nil? || (value.respond_to?(:length) && value.length == 0)
    None()
  else
    Some(value)
  end
end

def Some(value)
  Some.new(value)
end

def None
  None.new
end
# rubocop:enable MethodName
