# Require `beethoven/proc` to monkey patch Proc with these composition helpers.
class Proc
  def *(other)
    -> x { call(other.call(x)) }
  end

  def |(other)
    -> x { other.call(call(x)) }
  end
end
