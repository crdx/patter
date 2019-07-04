module Patter
  class Source < Array
    def get_samples n
      self.sample(n).map { |str| Sample.new(str) }
    end

    def get_sample
      get_samples(1).first
    end
  end
end
