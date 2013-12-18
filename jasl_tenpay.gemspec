$:.push File.expand_path("../lib", __FILE__)

require "jasl_tenpay/version"

Gem::Specification.new do |s|
  s.name          = "jasl_tenpay"
  s.version       = JaslTenpay::VERSION
  s.authors       = ["Jasl"]
  s.email         = ["jasl9187@hotmail.com"]
  s.homepage      = "https://github.com/jasl/tenpay"
  s.summary       = "An unofficial simple tenpay gem"
  s.description   = "An unofficial simple tenpay gem"
  s.license       = "MIT"

  s.require_paths = ["lib"]

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_development_dependency "bundler"
  s.add_development_dependency "rake"
  s.add_development_dependency "fakeweb"
end
