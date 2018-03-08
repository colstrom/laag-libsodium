
# -*- ruby -*-

require 'mkmf' # Ruby Standard Library

require 'laag' # MIT License
require_relative '../../../lib/laag/libsodium'

LAAG::BuildEnvironment
  .new(LAAG.libsodium)
  .script { default! }

create_makefile 'laag/libsodium'
