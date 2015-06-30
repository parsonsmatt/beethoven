# Beethoven

Composition is an incredibly useful technique in functional programming.
I have been missing that in my development with Ruby, so I set out to implement it here.

In Haskell, you can write a function like:

```haskell
-- f is a function that takes a value of type a
-- and returns a value of type b
f :: a -> b
```

We need some analogy with Ruby concepts.
It doesn't appear to be methods, messages, or objects.
Classes, however, seem to do it nicely.

1. Replace the arrow with `new`
2. `a` is the *interface* or *duck* that fits the single parameter of the class.
3. `b` is the interface/duck that fits the object produced by new.

So, we might express a class `F` that implements message `b` and expects an object responding to `a` as:

```ruby
class F
  attr_reader :b

  def initialize(x)
    @b = x.a
  end
end
```

Next up, we want some class that implements the duck that `F` expects.

```ruby
class G
  attr_reader :a

  def initialize(x)
    @a = x
  end
end

G.new(5).a
# => 5

F.new(G.new(5)).b
# => 5
```

This is class composition. But really, it'd be a lot nicer if we could write:

```ruby
(F * G).new(5).b
# => 5
```

Or, perhaps you prefer the bash-like pipe operator and reading your compositions from left to right.
No problem:

```ruby
(G | F).new(5).b
# => 5
```

Naturally, this is quite a bit more interesting when your classes do something other than simply returning the value they were given.
In this example, the classes expect a parameter that duck-types `value`.

```ruby
class Add5
  def initialize(x)
    @value = x.value
  end

  def value
    @value + 5
  end
end

class Multiply10
  def initialize(x)
    @value = x.value
  end

  def value
    @value * 10
  end
end

class Lift
  attr_reader :value

  def initialize(x)
    @value = x
  end
end

(Add5 * Multiply10 * Lift).new(7).value
#=> 75

(Lift | Multiply10 | Add5).new(4).value
#=> 45
```

If you'd prefer to compose classes directly, use `Beethoven::Composer`:

```ruby
Mul10Add5 = Beethoven::Composer.new(Lift, Multiply10, Add5)
Mul10Add5.new(5).value
#=> 55
```

A more practical example is presented [here](https://gist.github.com/parsonsmatt/c1abbb830b6976566198)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'beethoven'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install beethoven

## Contributing

1. Fork it ( https://github.com/[my-github-username]/beethoven/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
