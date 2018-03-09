
# -*- ruby -*-

require 'laag/library' # MIT License

module LAAG
  LIBSODIUM_GEM_ROOT = File.expand_path(File.join(__dir__, %w[.. ..]))
  LIBSODIUM_ORIGIN  = 'github.com/jedisct1/libsodium'
  LIBSODIUM_VERSION = (
    $LOADED_FEATURES
      .map { |f| f.match %r{/laag-libsodium-(?<version>[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)} }
      .compact
      .map { |gem| gem['version'] }
      .uniq
      .first
  ) || (
    File
      .basename(LIBSODIUM_GEM_ROOT)
      .match(%r{^laag-libsodium-(?<version>[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)})
      .named_captures
      .fetch('version')
  )

  def self.libsodium
    @@libsodium ||= Library.new(
      gem_root: LIBSODIUM_GEM_ROOT,
      origin:   LIBSODIUM_ORIGIN,
      version:  LIBSODIUM_VERSION
    )
  end
end
