# help.rb
# Defines help function for helping

# Usage String
programname = "jakhurun"
usag = " Usage: #{programname} <command> [options...]"

# Function for printing help
# Prints help
def help
  print "\n  Usage: jakhurun <command> [options...]\n"
  commands()
  options()
end

def commands
  settings = Runner::Set.new("env")
  appd = settings.setprop("app_dir")
  print "\n  Commands:\n"
  print "     build             Builds the web-app\n"
  print "     check             Checks if your config (.jakhu.yml) is ok and can be used\n"
  print "     info              Fetchs information about the daemon and the web-app from the daemon\n"
  print "     kill              Force the daemon to shutdown\n"
  print "     log               Displays the log of the daemon running the web-app (usually #{appd}/.jakhu/logs/#{Time.now.strftime("%y%m%d")}.log)\n"
  print "     pid               Displays the Process id for the daemon\n"
  print "     start             Start the daemon to run the web-app\n"
  print "     stop              Stops the daemon that is running the web-app\n"
end

def options
  print "\n  Options:\n"
  print "     -d, --no-daemon   Rather than run the web-app in the daemon, run it in the current terminal\n"
  print "     -f, --force       Force the job\n"
  print "     -h, --help        Output help\n"
  print "     -v, --version     Builds the web-app\n"
  print "     --verbose         Verbose mode\n"
end
