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
    @stackx = []
    @tyx = nil
    @call = caller[0]
  end

  def stack(file, line)
    @stackx.push("#{file}:#{line}")
  end

  def stackg(ex)
    @stackx.push(ex)
  end

  def set(ty)
    if ty == "gem"
      @tyx = false
    end
  end

  def throw()
    @stackx.push(@call)
    print "\nError!\n"
    print "#{@e}\n"
    print "#{@advicex}\n"
    if @tyx != false
      print "Err::#{@codex}"
    else
      print @codex
    end
    if @stackx != nil
      @stackx.each do |i|
        print "\n at #{i}"
      end
    end
    exit 1
  end

end
