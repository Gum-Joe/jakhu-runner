# logger.rb
# Essential function for logging

require_relative "set"

# Log function
# Logs ===> <worker_name>: <txt>
# @param [#log] txt the text to output
def log(txt)
  @settings = Runner::Set.new("env")
  worker = @settings.setprop("worker")
  print "===> #{worker}: #{txt}\n"
end
def loge(txt)
  @settings = Runner::Set.new("env")
  worker = @settings.setprop("worker")
  print "     #{worker}: #{txt}\n"
end

def log_rep(txt)
  @settings = Runner::Set.new("env")
  worker = @settings.setprop("worker")
  print "\r===> #{worker}: #{txt}\n"
end
