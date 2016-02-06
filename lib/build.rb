# build.rb
# Contains functions to provision tubs

require "yaml"
require_relative "logger"
require_relative "help"
require_relative "error"
require_relative "set"
require_relative "build_class"
# TODO: Uncomment lin below for production
# home = ENV["HOME"] || ENV["HOMEPATH"]

def build(args, worker, app, dir)
  # Load config
  home = ENV["HOME"]
  config = YAML.load_file("#{dir}/.jakhu.yml")
  tub = YAML.load_file("/app/.jakhu.yml")
  # See what to do
  build = Runner::Builder.new()
  # Create .jakhu dir
  require 'fileutils'
  FileUtils.mkdir_p "#{dir}/.jakhu"
  # Create file and append shebang
  @shebang = "#!/bin/bash\n"
  bui = File.open "#{dir}/.jakhu/build.sh","w+"
  bui.write @shebang

  if config["language"] == "nodejs"
    # Provision box
    log("Provisioning tub...")
    log("Packages to install:")
    log("   nodejs:  #{tub["version"]}")
    config["require"].each do |c|
      log("     #{c}:  latest")
    end
    # Add nvm install
    log("Installing required nodejs version...")
    bui.write "echo Installing required nodejs version...\n"
    @nvm = ". ~/.nvm/nvm.sh"
    bui.write "#{@nvm}\n"
    @ninstall = "nvm install #{tub["version"]}"
    bui.write "echo '#{@ninstall}'\n#{@ninstall}\n"
    log("`nvm install #{tub["version"]}`")
    `#{@ninstall}`
  end
end
