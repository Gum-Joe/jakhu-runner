# engine_nodejs.rb
# generates a scripts for a nodejs app

require "rubygems"
require "yaml"
require 'fileutils'
require 'rbconfig'
require_relative "../script/nvm"
require_relative "../core/buildinfo"
require_relative "../logger"
require_relative "../error"
require_relative "../set"
require_relative "../version"

module Runner
  module Generater
    class Nodejs
      def initialize(args)
        # Set settings
        # Create script
        script = ::Runner::Starter::ScriptNodejs.new("start.sh", args)
        bi = ::Runner::Starter::ScriptNodejs.new("build_info.sh", args)
        # Set up info about tub
        home = ENV["HOME"] || ENV["HOMEPATH"]
        @version = get_version()

        settings = Runner::Set.new("env")
        worker = settings.setprop("worker")
        app = settings.setprop("app_name")
        appd = settings.setprop("app_dir")
        config = YAML.load_file("#{appd}/.jakhu.yml")
        tub = YAML.load_file("#{home}/.jakhu/tub_config.yml")
        # Defines
        # BOSS_GENERATOR_VERSION = "0.1.0"
        # NVM_DIR = "/home/vagrant/.nvm"
        # BOSS_LANG_VERSION = tub["version"]
        # BOSS_OS = RbConfig::CONFIG['host_os']
        # Add build system info
        build = ::Core::Generater::BuildInfo.new(args, config, tub)
        bi.write(build.create_build_info())
        # Set nodejs version
        script.add_nvm(config["version"])
        envs = []
        envs.push "BOSS_LANG_VERSION"
        envs.push "BOSS_OS"
        envs.push "BOSS_RUNNER_VERSION"
        envs.push "BOSS_NODEJS_VERSION"
        envs.push "BOSS_RUBY_VERSION"
        envs.push "BOSS_PYTHON_VERSION"
        envs.push "BOSS_BOX_VERSION"
        envs.push "BOSS_TUB_ID"
        envs.push "BOSS_RUN_ID"
        envs.push "BOSS_TUB_NAME"
        envs.push "BOSS_APP_NAME"
      end
    end
  end
end
