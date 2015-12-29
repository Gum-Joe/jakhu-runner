require "rubygems"
require "yaml"
require 'fileutils'
require 'rbconfig'
require_relative "script"
require_relative "../logger"
require_relative "../error"
require_relative "../set"
require_relative "../version"

module Runner
  module Starter
    class ScriptNodejs
      def initialize(src, args)
        @args = args
        @home = ENV["HOME"] || ENV["HOMEPATH"]
        @version = get_version()
        @settings = ::Runner::Set.new("env")
        @worker = @settings.setprop("worker")
        @app = @settings.setprop("app_name")
        @dir = @settings.setprop("app_dir")
        @config = YAML.load_file("#{@dir}/.jakhu.yml")
        @tub = YAML.load_file("#{@home}/.jakhu/tub_config.yml")
        @configx = {}
        @configx["worker"] = @worker
        @configx["app"] = @app
        @configx["dir"] = @dir
        @script = ::Runner::Generater::Script.new("start.sh", args, @configx)
        # Append shebang
        @shebang = "#!/bin/bash\n"
        @script.write @shebang
      end
      def write(txtx)
        @script.write(txtx)
      end
      def add_nvm(version)
        @nodev = "nvm install #{version}"
        @nvmwrite = <<-SHELL
echo "Installing required nodejs version..."
echo #{@nodev}
echo
#{@nodev}
          SHELL
        @script.write(@nodev)
      end
    end
  end
end
