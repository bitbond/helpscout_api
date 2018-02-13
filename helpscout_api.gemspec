
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "helpscout_api/version"

Gem::Specification.new do |spec|
  spec.name          = "helpscout_api"
  spec.version       = HelpscoutApi::VERSION
  spec.authors       = ["garethfuller"]
  spec.email         = ["gareth@bitbond.com"]

  spec.summary       = %q{A simple ruby wrapper for the Helpscout API.}
  spec.description   = %q{A simple ruby wrapper for the Helpscout API.}
  spec.homepage      = "https://github.com/bitbond/helpscout_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "httparty"
end
