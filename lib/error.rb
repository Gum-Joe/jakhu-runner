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
  end

  def stack(file, line)
    @stack.push("#{file}:#{line}")
  end

  def throw(stack)
    print "\nError!\n"
    print "#{@e}\n"
    print "#{@advicex}"
    print "Err::#{@codex}"
    if stack != nil
      stack.each do |i|
        print "\n at #{i}"
      end
    end
    exit 1
  end

end
