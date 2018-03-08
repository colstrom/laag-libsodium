
# -*- ruby -*-

Gem::Specification.new do |spec|
  tag     = %x{git describe --tags --abbrev=0}.chomp
  commits = %x{git rev-list --count #{tag}..HEAD}.chomp

  spec.name          = "laag-libsodium"
  spec.version       = "#{tag}.#{commits}"
  spec.authors       = ["Chris Olstrom"]
  spec.email         = ["chris@olstrom.com"]
  spec.summary       = "Library as a Gem - libsodium"
  spec.homepage      = "https://github.com/colstrom/laag-libsodium"
  spec.licenses      = ['ISC']
  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ["lib"]
  spec.extensions    = ["ext/laag/libsodium/extconf.rb"]

  spec.add_runtime_dependency 'laag', '~> 0.4', '>= 0.4.4'
end
