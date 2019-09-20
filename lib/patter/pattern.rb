module Patter
    TAGS = {
        'S' => :symbols,
        'A' => :adjectives,
        'D' => :digits,
        'C' => :chars,
        'N' => :nouns,
    }

    MODIFIERS = {
        's' => :pluralize,
        'a' => :altcase,
        'l' => :downcase,
        'u' => :upcase,
        't' => :titleize,
    }

    class Pattern
        def initialize(pattern, source_provider = SourceProvider.instance)
            @pattern = pattern
            @source_provider = source_provider
        end

        def to_s
            @pattern.gsub(/\{([#{TAGS.keys.join}])(:(\w+))?\}/) do
                tag, modifiers = $1, $3
                source = @source_provider.get_source(TAGS[tag])

                next source.get_sample if !modifiers

                re = /([#{MODIFIERS.keys.join}])|([0-9]+)/
                chain = []
                n = 1

                modifiers.split(re).reject(&:empty?).each do |modifier|
                    if modifier =~ /([0-9]+)/
                        n = $1.to_i
                    end

                    if MODIFIERS[modifier]
                        chain << MODIFIERS[modifier]
                    end
                end

                source.get_samples(n).map do |sample|
                    sample.transform(chain)
                end.join
            end
        end
    end
end
