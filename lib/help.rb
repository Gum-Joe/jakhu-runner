# help.rb
# Defines help function for helping

# Usage String
programname = "bossrun"
usag = " Usage: #{programname} <command> [options...]"

# Function for printing help
# Prints help
def help
  print "\n  Usage: bossrun <command> [options...]\n"
  commands()
  #options()
end

def commands
  print "\n  Commands:\n"
  print "     build         Builds the web-app\n"
  print "     check         Checks if your config (.boss.yml) is ok and can be used\n"
  print "     info          Fetchs information about the daemon and the web-app from the daemon\n"
  print "     kill          Force the daemon to shutdown\n"
  print "     log           Displays the log of the daemon running the web-app (usually #{ENV["BOSS_WEB_DIR"]}/.boss/logs/#{Time.now.strftime("%y%m%d")}.log)\n"
  print "     pid           Displays the Process id for the daemon\n"
  print "     start         Start the daemon to run the web-app\n"
  print "     stop          Stops the daemon that is running the web-app\n"
end
