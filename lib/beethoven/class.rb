class Class
  def *(other)
    Beethoven::Composer.new(other, self)
  end

  def |(other)
    Beethoven::Composer.new(self, other)
  end
end
