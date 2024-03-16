require_relative 'lib/patter/version'

Gem::Specification.new do |spec|
    spec.homepage = 'https://github.com/crdx/patter'
    spec.summary = 'Pattern generator'
    spec.name = 'patter'
    spec.version = Patter::VERSION
    spec.author = 'crdx'
    spec.license = 'GPLv3'
    spec.metadata['rubygems_mfa_required'] = 'true'

    spec.required_ruby_version = '>= 3.0'

    spec.files = Dir['{words,lib}/**/*']
    spec.executables = ['patter']

    spec.add_runtime_dependency 'colorize', '~> 0.8.1'
    spec.add_runtime_dependency 'docopt', '~> 0.6.1'
    spec.add_runtime_dependency 'json', '~> 2.7'

    spec.add_development_dependency 'rake', '~> 13.0'
    spec.add_development_dependency 'rspec', '~> 3.8'
    spec.add_development_dependency 'simplecov', '~> 0.21'
end
