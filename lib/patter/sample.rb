module Patter
    class Sample
        def initialize str
            @str = str
        end

        def method_missing s
            @str = @str.send s
        end

        def altcase
            @str = @str.chars.each_with_index.map do |c, i|
                if i % 2 == 0 then c.upcase else c.downcase end
            end.join
        end

        def to_s
            @str
        end
        alias_method :to_str, :to_s
    end
end
