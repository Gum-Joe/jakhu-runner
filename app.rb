#!/usr/bin/env ruby

# app.rb
# Parses args
# Provisions box
# Runs app
# Symb-link: bin/bossrun

# Require out logger in lib/
require_relative "lib/logger"

# Version number
# Also, set args to the ARGV array
# For easier reference
version = "0.1.0"
args = ARGV.dup

# Fast track to showing version number and help
if args.include?('-v')
  print version
  exit 0
end
# Fast-track to help
if args.include?('--help') || args.include?('-h')
  print version
  exit 0
end
print "Boss runner\nVersion #{version}\n"

log("Starting Web")
# Args checking
