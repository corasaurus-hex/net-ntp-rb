lib = File.expand_path("lib", __dir__)
$:.unshift lib unless $:.include?(lib)

require "net/ntp/version"

Gem::Specification.new do |s|
  s.name = "net-ntp"
  s.version = Net::NTP::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Cora Sutton", "Jerome Waibel", "Brandon Arbini"]
  s.email = ["cora@sutton.me"]
  s.homepage = "http://github.com/zencoder/net-ntp"
  s.summary = "NTP client for ruby."
  s.description = "Query an NTP server as specified in RFC1305 and RFC2030."
  s.files = Dir.glob("lib/**/*") + %w[LICENSE README.markdown Rakefile]
  s.require_path = "lib"
  s.required_ruby_version = ">= 2.7"
  s.add_development_dependency "standard", "~> 1.11.0"
  s.add_development_dependency "rake", "~> 13.0.6"
  s.add_development_dependency "test-unit", "~> 3.5.3"
  s.add_development_dependency "rspec", "~> 3.11.0"
  s.add_development_dependency "minitest", "~> 5.15.0"
end
