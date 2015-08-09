require 'beethoven/version'
require 'beethoven/composer'

# The Beethoven module can be used in order to provide convenience operators for
# the Beethoven::Composer class.
module Beethoven
  refine Object do
    def *(other)
      Beethoven::Composer.new(other, self)
    end

    def |(other)
      Beethoven::Composer.new(self, other)
    end
  end

  refine Proc do
    def *(other)
      -> x { call(other.call(x)) }
    end

    def |(other)
      -> x { other.call(call(x)) }
    end
  end
end
