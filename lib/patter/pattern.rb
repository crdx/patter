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
                    n = $1.to_i if modifier =~ /([0-9]+)/
                    chain << MODIFIERS[modifier] if MODIFIERS[modifier]
                end

                samples = source.get_samples(n)
                chain.each { |tran| samples.each &tran }
                samples.join
            end
        end

        def self.help
            return <<~EOF
                TAGS

                    {A} adjective       {N} noun
                    {S} symbol          {D} digit
                    {C} character

                MODIFIERS

                    s: plural           t: titlecase
                    u: uppercase        l: lowercase
                    a: AlTeRnAtE case
                    <number>: repeat <number> times

                Apply modifiers using a colon after the tag name.

                EXAMPLES

                    Ten random uppercase letters: {C:10u}
                    Three camelcase nouns:        {N:3t}
                    Plural, titlecase noun:       {N:ts}
                    Uppercase adjective:          {A:u}
                    Five random digits:           {D:5}
                    A username:                   {A}_{N}
            EOF
        end
    end
end
