require 'beethoven/composer'

RSpec.describe Beethoven::Composer do
  # F :: () -> a
  class F
    attr_reader :a

    def initialize(o)
      @a = o
    end
  end

  # G :: a -> b
  class G
    attr_reader :b

    def initialize(o)
      @b = o.a
    end
  end

  # H :: b -> c
  class H
    attr_reader :c

    def initialize(o)
      @c = o.b
    end
  end

  subject { Beethoven::Composer }

  describe 'composes classes' do
    it 'transfers the value' do
      expect(subject.new(F, G, H).new(5).c).to eq(5)
    end

    it 'can take array of classes' do
      expect(subject.new([F, G, H]).new(5).c).to eq(5)
    end
  end
end
