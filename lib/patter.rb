require 'colorize'
require 'docopt'

require 'singleton'

module Patter
    def self.root_dir
        File.expand_path('..', __dir__)
    end
end

require_relative 'patter/source_provider'
require_relative 'patter/inflector'
require_relative 'patter/pattern'
require_relative 'patter/source'
require_relative 'patter/sample'
require_relative 'patter/version'
