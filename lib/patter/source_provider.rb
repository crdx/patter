module Patter
    class SourceProvider
        include Singleton

        def get_source type
            Source.new(send(type))
        end

        private

        def gem_root
            __dir__ + "/../../"
        end

        def get_wordlist type
            File.read(gem_root + "/words/#{type}.txt").split
        end

        def chars
            'abcdefghijklmnopqrstuvwxyz'.split('').shuffle
        end

        def adjectives
            @adjectives ||= get_wordlist('adjectives')
        end

        def nouns
            @nouns ||= get_wordlist('nouns')
        end

        def symbols
            '!#$%&()*+,-=./:;<?>@[\]^_'.split('')
        end

        def digits
            '123456789'.split('')
        end
    end
end
