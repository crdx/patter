module Patter
    class Sample
        def initialize(str)
            @str = str
        end

        def method_missing(method_symbol)
            @str = @str.send(method_symbol)
        end

        def altcase
            @str = @str.chars.each_with_index.map do |char, i|
                if i % 2 == 0 then
                    char.upcase
                else
                    char.downcase
                end
            end.join
        end

        def to_s
            @str
        end
        alias_method :to_str, :to_s
    end
end
