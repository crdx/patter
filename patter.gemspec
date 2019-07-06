Gem::Specification.new do |spec|
  spec.homepage = 'https://github.com/crdx/patter'
  spec.summary  = 'Generate strings from patterns.'
  spec.name     = 'patter'
  spec.version  = '1.0.5'
  spec.author   = 'crdx'
  spec.license  = 'MIT'

  spec.files    = Dir['{words,lib}/**/*']
  spec.executables = ['patter']

  spec.add_runtime_dependency 'activesupport', '~> 5.2.3'
  spec.add_runtime_dependency 'docopt', '~> 0.6.1'

  spec.add_development_dependency 'bundler', '~> 2.0'
end
