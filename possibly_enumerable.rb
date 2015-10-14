class Maybe
  ([:each] + Enumerable.instance_methods).each do
    |enumerable_method|
    define_method(enumerable_method) do
      |*args, &block|

      res = __enumerable_value
            .send(enumerable_method,
                  *args, &block)

      if res.respond_to?(:each)
        Maybe(res.first)
      else
        res
      end
    end
  end
end

class Some < Maybe
  def initialize(value)
    @value = value
  end

  def __enumerable_value
    [@value]
  end
end

def Some(value)
  Some.new(value)
end

class None < Maybe
  def __enumerable_value
    []
  end
end

def None
  None.new
end
