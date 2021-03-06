# set.rb
# sets settings
# NOTE: this is a prototype of tub.rb
# TODO: Jakhu should inject tub.rb

require 'yaml'
require_relative "error"

# NOTE: Uncomment line below for production
# home = ENV["HOME"] || ENV["HOMEPATH"]
home = ENV["HOME"]

module Runner
  class Set
    def initialize(type)
      if type == "env"
        @prtype = "env"
        @home = ENV["HOME"]
      end
    end

    def setprop(prop)
      # What is it?
      if prop == "worker"
        # If it can find config, use it
        if File.file?("#{@home}/.jakhu/tub_config.yml")
          # Parse YAML
          config = YAML.load_file("#{@home}/.jakhu/tub_config.yml")
          if config["name"]
            return config["name"]
          else
            # assume error
            err = Error.new("ENONAME", "Property 'name' not found in tub config (#{@home}/.jakhu/tub_config.yml)!", "Please add the 'name' field to config (#{@home}/.jakhu/tub_config.yml)")
            stacks = []
            err.stackg(caller[0])
            err.stackg("#{@home}/.jakhu/tub_config.yml:1")
            err.throw()
            return "Error!"
          end
        end
        if ENV["JAKHU_WORKER_NAME"]
          return ENV["JAKHU_WORKER_NAME"]
        else
          err = Error.new("ENOENV", "Could not set property '#{prop}'!", "Please set the enviroment variable 'JAKHU_WORKER_NAME' or specify it in config (#{@home}/.jakhu/tub_config.yml)")
          stackss = []
          err.stackg(caller[0])
          err.stackg("#{ENV["PWD"]}/lib/error.rb")
          err.throw()
          return "Error!"
        end
      end

      if prop == "app_name"
        # If it can find config, use it
        if File.file?("#{@home}/.jakhu/tub_config.yml")
          # Parse YAML
          config = YAML.load_file("#{@home}/.jakhu/tub_config.yml")
          if config["app"]
            return config["app"]
          else
            # assume error
            err = Error.new("ENONAME", "Property 'app' not found in tub config (#{@home}/.jakhu/tub_config.yml)!", "Please add the 'app' field to config (#{@home}/.jakhu/tub_config.yml)")
            stacks = []
            err.stackg(caller[0])
            err.stackg("#{@home}/.jakhu/tub_config.yml:7")
            err.throw()
            return "Error!"
          end
        else
          if ENV["JAKHU_APP_NAME"]
            return ENV["JAKHU_APP_NAME"]
          else
            err = Error.new("ENOENV", "Could not set property '#{prop}'!", "Please set the enviroment variable 'JAKHU_APP_NAME' or specify it in config (#{@home}/.jakhu/tub_config.yml)")
            stackss = []
            err.stackg(caller[0])
            err.stackg("env")
            err.throw()
            return "Error!"
          end
        end
      end

      if prop == "app_dir"
        # If it can find config, use it
        if File.file?("#{@home}/.jakhu/tub_config.yml")
          # Parse YAML
          config = YAML.load_file("#{@home}/.jakhu/tub_config.yml")
          if config["dir"]
            return config["dir"]
          else
            # assume error
            err = Error.new("ENONAME", "Property 'dir' not found in tub config (#{@home}/.jakhu/tub_config.yml)!", "Please add the 'dir' field to config (#{@home}/.jakhu/tub_config.yml)")
            stacks = []
            err.stackg(caller[0])
            err.stackg("#{@home}/.jakhu/tub_config.yml:5")
            err.throw()
            return "Error!"
          end
        else
          if ENV["JAKHU_APP_DIR"]
            return ENV["JAKHU_APP_DIR"]
          else
            err = Error.new("ENOENV", "Could not set property '#{prop}'!", "Please set the enviroment variable 'JAKHU_APP_DIR' or specify it in config (#{@home}/.jakhu/tub_config.yml)")
            stackss = []
            err.stackg(caller[0])
            err.stackg("env")
            err.throw()
            return "Error!"
          end
        end
      end
    end

  end
end
