module Beethoven
  class Composer
    def initialize(*fs)
      @fs = fs
    end

    def new(x)
      @fs.reduce(x) { |a, e| e.new(a) }
    end

    def *(other)
      self.class.new(other, self)
    end

    def |(other)
      self.class.new(self, other)
    end
  end
end
