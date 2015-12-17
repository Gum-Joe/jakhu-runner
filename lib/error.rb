# error.rb
# File for throwing errors

# Error class
# TODO: Add sending to boss server
# @param String code the error code
# @param String emessage the error message
# @param String advice advice for the user
class Error
  def initialize(code, emessage, advice)
    @codex = code
    @e = emessage
    @advicex = advice
  end
  def throw
    print "\nError!\n"
    print "#{@e}\n"
    print "#{@advicex}\n"
    print "Err::#{@codex}"
    exit 1
  end
end
