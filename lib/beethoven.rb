require "beethoven/version"
require "beethoven/composer"
require "beethoven/composable"

module Beethoven
  refine Class do
    def *(other)
      Beethoven::Composer.new(other, self)
    end

    def |(other)
      Beethoven::Composer.new(self, other)
    end
  end

  refine Object do
    def *(other)

    end

    def |(other)

    end
  end
end
