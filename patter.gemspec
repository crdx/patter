require_relative 'lib/patter/version'

Gem::Specification.new do |spec|
    spec.homepage = 'https://github.com/crdx/patter'
    spec.summary  = 'Generate strings from patterns.'
    spec.name     = 'patter'
    spec.version  = Patter::VERSION
    spec.author   = 'crdx'
    spec.license  = 'MIT'

    spec.files    = Dir['{words,lib}/**/*']
    spec.executables = ['patter']

    spec.add_runtime_dependency 'docopt', '~> 0.6.1'

    spec.add_development_dependency 'rspec', '~> 3.8'
    spec.add_development_dependency 'rake', '~> 12.3'
end
