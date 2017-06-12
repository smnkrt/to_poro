# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "to_poro/version"

Gem::Specification.new do |spec|
  spec.name          = "to_poro"
  spec.version       = ToPoro::VERSION
  spec.authors       = ["smnkrt"]
  spec.email         = ["skrt12@gmail.com"]

  spec.summary       = %q{Include it into ActiveRecord::Relation and fetch data as PORO classes instead of ActiveRecord objects.}
  spec.description   = %q{Simple module allowing fetching data as Ruby objects.}
  spec.homepage      = "https://github.com/smnkrt/to_poro"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
