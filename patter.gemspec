require_relative 'lib/patter/version'

Gem::Specification.new do |spec|
    spec.homepage = 'https://github.com/crdx/patter'
    spec.summary  = 'Pattern generator'
    spec.name     = 'patter'
    spec.version  = Patter::VERSION
    spec.author   = 'crdx'
    spec.license  = 'MIT'

    spec.files    = Dir['{words,lib}/**/*']
    spec.executables = ['patter']

    spec.add_runtime_dependency 'colorize', '~> 0.8.1'
    spec.add_runtime_dependency 'docopt',   '~> 0.6.1'

    spec.add_development_dependency 'simplecov', '~> 0.21'
    spec.add_development_dependency 'rspec',     '~> 3.8'
    spec.add_development_dependency 'rake',      '~> 13.0'
end
