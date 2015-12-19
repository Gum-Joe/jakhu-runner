# build.rb
# Contains functions to provision tubs

require "yaml"
require_relative "logger"
require_relative "help"
require_relative "error"
require_relative "set"
# TODO: Uncomment lin below for production
# home = ENV["HOME"] || ENV["HOMEPATH"]
home = ENV["PWD"]

def build(args, worker, app, dir)
  # Load config
  config = YAML.load_file("#{dir}/.boss.yml")
  # See what to do
  print config["name"]
end
