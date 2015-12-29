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
  module Generater
    class Script
      def initialize(script, args, con)
        verc = nil
        worker = con["worker"]
        app = con["app"]
        dir = con["dir"]
        if args.include?("--verbose")
          puts("\r     #{worker}: Creating dir for worker files...") if File.directory?("#{dir}/.jakhu/#{worker}") != true
        end
        begin
          FileUtils.mkdir_p "#{dir}/.jakhu/#{worker}" if File.directory?("#{dir}/.jakhu/#{worker}") != true
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
          puts("\r     #{worker}: Creating dir for worker files...Done!") if File.directory?("#{dir}/.jakhu/#{worker}") != true
        end
        loge("Generating a #{script} in '#{dir}/.jakhu/#{worker}/#{script}'...")
        @script = File.open("#{dir}/.jakhu/#{worker}/#{script}", "w+")
      end
      def write(txt)
        @script.write(txt)
      end
    end
  end
end
