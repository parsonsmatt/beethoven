require 'spec_helper'
require 'beethoven'

RSpec.describe Beethoven do
  describe 'class composition' do
    # F's initialize takes an object with interface a and returns an object with
    # interface b. Can be thought of as:
    # F :: a -> b
    class F
      attr_reader :b
      def initialize(x)
        @b = x.a
      end
    end

    # G's initialize takes an object and gives it the interface a. Can be
    # expressed like:
    # G :: _ -> a
    class G
      attr_reader :a

      def initialize(x)
        @a = x
      end
    end

    # H takes an a and returns an a.
    # H :: a -> a
    class H
      attr_reader :a

      def initialize(x)
        @a = x.a
      end
    end

    describe 'with *' do
      it 'composes classes like math functions' do
        expect( (F * G).new(5).b ).to eq( F.new(G.new(5)).b )
      end

      it 'can be chained' do
        expect( (F * H * G).new(5).b ).to eq( F.new(H.new(G.new(5))).b )
      end
    end

    describe 'with |' do
      it 'composes classes like pipes' do
        expect( (G | F).new(5).b ).to eq( F.new(G.new(5)).b )
      end

      it 'can be chained' do
        expect( (G | H | F).new(5).b ).to eq( F.new(H.new(G.new(5))).b )
      end
    end
  end
end
