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
  s.add_development_dependency "standard"
  s.add_development_dependency "rake"
  s.add_development_dependency "test-unit"
end
