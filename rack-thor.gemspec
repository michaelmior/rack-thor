Gem::Specification.new do |s|
  s.name        = 'rack-thor'
  s.version     = '0.1.0'
  s.license     = 'GPL-3.0'
  s.summary     = 'Schema design for NoSQL applications'
  s.author      = 'Michael Mior'
  s.email       = 'mmior@uwaterloo.ca'
  s.files       = Dir['lib/**/*']
  s.homepage    = 'https://github.com/michaelmior/rack-thor/'

  s.add_dependency 'hanami-router', '~> 1.1.0', '>= 1.1.0'
  s.add_dependency 'rack', '~> 2.0.4', '>= 2.0.0'
  s.add_dependency 'rake', '~> 12.3.0', '>= 12.3.0'

  s.add_development_dependency 'pry-nav', '~> 0.2.4', '>= 0.2.0'
  s.add_development_dependency 'pry-rescue', '~> 1.4.4', '>= 1.4.0'
  s.add_development_dependency 'rack-test', '~> 0.6.3', '>= 0.6.0'
  s.add_development_dependency 'rspec', '~> 3.5.0', '>= 3.5.0'
  s.add_development_dependency 'rspec-core', '~> 3.5.4', '>= 3.5.0'
  s.add_development_dependency 'rspec-collection_matchers', '~> 1.1.2', '>= 1.1.0'
  s.add_development_dependency 'scrutinizer-ocular', '~> 1.0.1', '>= 1.0.0'
  s.add_development_dependency 'simplecov', '~> 0.12.0'
  s.add_development_dependency 'thor'
  s.add_development_dependency 'yard', '~> 0.9.4'
end
