module Patter
    class Sample < String
        def pluralize
            self.class.new(Inflector.pluralize(self))
        end

        def titleize
            self.class.new(self[0].upcase + self[1..])
        end

        def altcase
            self.class.new(chars.each_with_index.map do |char, i|
                if i % 2 == 0 then
                    char.upcase
                else
                    char.downcase
                end
            end.join)
        end

        def transform(chain)
            chain.inject(self) do |str, transformer|
                str.send(transformer)
            end
        end
    end
end
