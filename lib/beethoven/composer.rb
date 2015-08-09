module Beethoven
  # Composer composes class instantiation. The first call to new refers to the
  # `initialize` method, and creates an object which duck-types Class.new. When
  # `Composer#new` is called, the classes are instantiated in order, where the
  # argument passed to the first class is the argument passed to Composer#new,
  # and each subsequent class receives the instantiated object as its argument.
  class Composer
    def initialize(*fs)
      @fs = if fs.size == 1 && fs[0].is_a?(Array)
              fs[0]
            else
              fs
            end
    end

    def new(x)
      @fs.reduce(x) { |a, e| e.new(a) }
    end
  end
end
