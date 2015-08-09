# Require `beethoven/object` to monkey patch Object with the class composition
# operators.
class Object
  def *(other)
    Beethoven::Composer.new(other, self)
  end

  def |(other)
    Beethoven::Composer.new(self, other)
  end
end
