# logger.rb
# Essential function for logging

# Log function
# Logs ===> <worker_name>: <txt>
# @param [#log] txt the text to output
def log(txt)
  print "===> #{ENV["BOSS_WORKER_NAME"]}: #{txt}\n"
end

def log_rep(txt)
  print "\r===> #{ENV["BOSS_WORKER_NAME"]}: #{txt}\n"
end
