Gem::Specification.new do |gem|
  gem.name     = "locust"
  gem.version  = "0.0.1"
  gem.author   = "Andrew Kozin (nepalez)"
  gem.email    = "andrew.kozin@gmail.com"
  gem.homepage = "https://github.com/nepalez/locust"
  gem.summary  = "Generator of examples for mutation testing of public APIs"
  gem.license  = "MIT"

  gem.files            = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.test_files       = gem.files.grep(/^spec/)
  gem.extra_rdoc_files = Dir["README.md", "LICENSE", "CHANGELOG.md"]
  gem.executables      = %w[locust]

  gem.required_ruby_version = ">= 2.3"

  gem.add_runtime_dependency "dry-initializer", "~> 2.4"

  gem.add_development_dependency "inch", "~> 0.7"
  gem.add_development_dependency "rake", "> 10"
  gem.add_development_dependency "rspec", "~> 3.0"
  gem.add_development_dependency "rspec-its", "~> 1.2"
  gem.add_development_dependency "rubocop", "~> 0.49"
  gem.add_development_dependency "webmock", "~> 3.3"
end
