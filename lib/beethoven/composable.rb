module Beethoven
  module Composable
    def *(other)
      new(other, self)
    end

    def |(other)
      new(self, other)
    end
  end
end
