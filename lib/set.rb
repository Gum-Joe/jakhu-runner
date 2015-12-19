# set.rb
# sets settings
# NOTE: this is a prototype of tub.rb
# TODO: Boss should inject tub.rb

require 'yaml'
require_relative "error"

# NOTE: Uncomment line below for production
# home = ENV["HOME"] || ENV["HOMEPATH"]
home = ENV["PWD"]

module Runner
  class Set
    def initialize(type)
      if type == "env"
        @prtype = "env"
        @home = ENV["PWD"]
      end
    end

    def setprop(prop)
      # What is it?
      if prop == "worker"
        # If it con find config, use it
        if File.file?("#{@home}/boss/tub_config.yml")
          # Parse YAML
          config = YAML.load_file("#{@home}/boss/tub_config.yml")
          if config["name"]
            return config["name"]
          else
            # assume error
            err = Error.new("ENONAME", "Property 'name' not found in tub config (#{@home}/boss/tub_config.yml)!", "Please add the 'name' field to config (#{@home}/boss/tub_config.yml)")
            stacks = []
            stacks.push("#{ENV["PWD"]}/lib/set.rb:33")
            stacks.push("#{@home}/boss/tub_config.yml:1")
            err.throw(stacks)
            return "Error!"
          end
        end
        if ENV["BOSS_WORKER_NAME"]
          return ENV["BOSS_WORKER_NAME"]
        else
          err = Error.new("ENOENV", "Could not set property '#{prop}'!", "Please set the enviroment variable 'BOSS_WORKER_NAME' or specify it in config (#{@home}/boss/tub_config.yml)")
          stackss = []
          stackss.push("#{ENV["PWD"]}/lib/set.rb:44")
          stackss.push("#{ENV["PWD"]}/lib/error.rb")
          stackss.push("#{@home}/boss")
          err.throw(stackss)
          return "Error!"
        end
      end

      if prop == "app_name"
        # If it con find config, use it
        if File.file?("#{@home}/boss/tub_config.yml")
          # Parse YAML
          config = YAML.load_file("#{@home}/boss/tub_config.yml")
          if config["app"]
            return config["app"]
          else
            # assume error
            err = Error.new("ENONAME", "Property 'app' not found in tub config (#{@home}/boss/tub_config.yml)!", "Please add the 'app' field to config (#{@home}/boss/tub_config.yml)")
            stacks = []
            stacks.push("#{ENV["PWD"]}/lib/set.rb:62")
            stacks.push("#{@home}/boss/tub_config.yml:7")
            err.throw(stacks)
            return "Error!"
          end
        end
        if ENV["BOSS_APP_NAME"]
          return ENV["BOSS_APP_NAME"]
        else
          err = Error.new("ENOENV", "Could not set property '#{prop}'!", "Please set the enviroment variable 'BOSS_APP_NAME' or specify it in config (#{@home}/boss/tub_config.yml)")
          stackss = []
          stackss.push("#{ENV["PWD"]}/lib/set.rb:73")
          stackss.push("#{ENV["PWD"]}/lib/error.rb")
          stackss.push("env")
          stackss.push("#{@home}/boss")
          err.throw(stackss)
          return "Error!"
        end
      end
    end

  end
end
