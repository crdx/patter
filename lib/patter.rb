require 'singleton'

require_relative 'patter/source_provider'
require_relative 'patter/inflector'
require_relative 'patter/pattern'
require_relative 'patter/source'
require_relative 'patter/sample'
require_relative 'patter/version'

module Patter
    def self.root
        File.expand_path('../..', __FILE__)
    end
end
