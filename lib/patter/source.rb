module Patter
    class Source < Array
        def get_samples(n)
            sample(n).map { Sample.new(_1) }
        end

        def get_sample
            get_samples(1).first
        end
    end
end
