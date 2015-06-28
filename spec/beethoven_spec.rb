describe Beethoven do
  describe 'monkey patches class' do
    describe '*' do
      it 'composes classes' do
        class F
          attr_reader :b
          def initialize(x)
            @b = x.a
          end
        end

        class G
          attr_reader :a

          def initialize(x)
            @a = x
          end
        end

        expect((F * G).new(5)).to eq(F.new(G.new(5)))
      end
    end
  end
end
