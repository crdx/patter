module Patter
    class SourceProvider
        include Singleton

        def get_source(type)
            Source.new(send(type))
        end

        private

        def get_wordlist(type)
            File.read(Patter.root_dir + "/words/#{type}.txt").split
        end

        def chars
            'abcdefghijklmnopqrstuvwxyz'.chars.shuffle
        end

        def adjectives
            @adjectives ||= get_wordlist('adjectives')
        end

        def nouns
            @nouns ||= get_wordlist('nouns')
        end

        def symbols
            '!#$%&()*+,-=./:;<?>@[\]^_'.chars
        end

        def digits
            '123456789'.chars
        end
    end
end
