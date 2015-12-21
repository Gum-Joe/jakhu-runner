# starter.rb
# Starts the web-app
require "rubygems"
require "yaml"
require 'fileutils'
require 'rbconfig'
require_relative "logger"
require_relative "error"
require_relative "set"

def start_app(args, worker, app, dir)
  # Set up info about tub
  # TODO: Uncomment lin below for production
  # home = ENV["HOME"] || ENV["HOMEPATH"]
  home = ENV["PWD"]

  settings = Runner::Set.new("env")
  worker = settings.setprop("worker")
  app = settings.setprop("app_name")
  appd = settings.setprop("app_dir")
  config = YAML.load_file("#{appd}/.boss.yml")
  tub = YAML.load_file("#{home}/boss/tub_config.yml")

  verc = nil
  if args.include?("--verbose")
    puts("\r     #{worker}: Creating dir for worker files...") if File.directory?("#{dir}/.boss/#{worker}") != true
  end
  begin
    FileUtils.mkdir_p "#{dir}/.boss/#{worker}" if File.directory?("#{dir}/.boss/#{worker}") != true
  rescue Exception => e
    err = Error.new(e.class, e.message, nil)
    err.set("gem")
    era = eval(e.backtrace.inspect)
    xy = 1
    while xy < era.length
      err.stackg(era[xy])
      xy +=1
    end
    err.stackg(caller[0])
    err.throw()
  end
  if args.include?("--verbose")
    puts("\r     #{worker}: Creating dir for worker files...Done!") if File.directory?("#{dir}/.boss/#{worker}") != true
  end
  loge("Generating a start.sh in '#{dir}/.boss/#{worker}/start.sh'...")
  # Create File
  begin
    star = File.open("#{dir}/.boss/#{worker}/start.sh", "w+")
  rescue Exception => e
    err = Error.new(e.class, e.message, nil)
    err.set("gem")
    era = eval(e.backtrace.inspect)
    xy = 1
    while xy < era.length
      err.stackg(era[xy])
      xy +=1
    end
    err.throw()
  end
  # Append shebang
  @shebang = "#!/bin/bash\n"
  star.write @shebang
  # Add ENV
  # Main env
  @envo = <<-SHELL
echo "Setting enviroment variables for this tub..."
echo export BOSS_APP_DIR=#{appd}
export BOSS_APP_DIR=#{appd}
echo export BOSS_APP_NAME=#{app}
export BOSS_APP_NAME=#{app}
echo export BOSS_WORKER_NAME=#{worker}
export BOSS_WORKER_NAME=#{worker}

# Tub envs
export BOSS_LANG_VERSION=#{tub["version"]}
export BOSS_OS=#{Config::CONFIG[‘host_os’]}
   SHELL
  star.write @envo
  envs = []
  envs.push("BOSS_LANG_VERSION")
  envs.push("BOSS_OS")
  envs.push "BOSS_APP_DIR"
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

# ENV
# BOSS_LANG_VERSION
# BOSS_OS
# BOSS_RUNNER_VERSION
# BOSS_NODEJS_VERSION
# BOSS_RUBY_VERSION
# BOSS_PYTHON_VERSION
# BOSS_BOX_VERSION
# BOSS_RUN_ID
# BOSS_TUB_ID
# BOSS_APP_NAME
# BOSS_TUB_NAME
