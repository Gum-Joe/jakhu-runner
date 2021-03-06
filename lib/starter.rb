# starter.rb
# Starts the web-app
require "rubygems"
require "yaml"
require 'fileutils'
require 'rbconfig'
require_relative "script/nvm"
require_relative "script/script"
require_relative "engine/nodejs"
require_relative "logger"
require_relative "error"
require_relative "set"

def start_app(args, worker, app, dir)
  # Set up info about tub
  # TODO: Uncomment lin below for production
  # home = ENV["HOME"] || ENV["HOMEPATH"]
  home = ENV["HOME"]

  settings = ::Runner::Set.new("env")
  worker = settings.setprop("worker")
  app = settings.setprop("app_name")
  appd = settings.setprop("app_dir")
  config = YAML.load_file("#{appd}/.jakhu.yml")
  tub = YAML.load_file("#{home}/.jakhu/tub_config.yml")
  languages = []
  languages.push "nodejs"
  languages.push "ruby"
  languages.push "python"
  if config["language"] == "nodejs"
    scr = Runner::Generater::Nodejs.new(args)
  end
  if config["language"] == "ruby"
    scr = Runner::Generater::Ruby.new(args)
  end
  if config["language"] == "python"
    scr = Runner::Generater::Python.new(args)
  end
  loge("Generated script!")
  log("Starting daemond to run script...")
  # Start daemond
  # Uncomment when ready
  # daemon = Core::Daemond::Starter.new("start.sh")
  # daemon.set_port(6060)
  # daemon.set_pid(1234)
  # daemon.set_log("#{appd}/.jakhu/#{worker}/logs/#{Time}")
  # daemon.set_jakhu_server("http://.jakhu.js:#{port}")
  # daemon.start()
end

# ENV
# JAKHU_LANG_VERSION
# JAKHU_OS
# JAKHU_RUNNER_VERSION
# JAKHU_NODEJS_VERSION
# JAKHU_RUBY_VERSION
# JAKHU_PYTHON_VERSION
# JAKHU_BOX_VERSION
# JAKHU_RUN_ID
# JAKHU_TUB_ID
# JAKHU_APP_NAME
# JAKHU_TUB_NAME
