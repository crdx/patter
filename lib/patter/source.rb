module Patter
    class Source < Array
        def get_samples(n)
            sample(n).map { |sample| Sample.new(sample) }
        end

        def get_sample
            get_samples(1).first
        end
    end
end
