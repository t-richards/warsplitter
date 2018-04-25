require "string_scanner"

module Warsplitter
  VERSUS     = /vs/
  CONTEXT    = /;/
  WHITESPACE = /\s+/

  class WarCrime < Exception
  end

  class SyntaxError < WarCrime
  end
end

class War
  property first_option : String = ""
  property second_option : String = ""
  property context : String = ""

  def initialize(input : String)
    s = StringScanner.new(input)
    first_option = s.scan_until(Warsplitter::VERSUS)
    raise Warsplitter::SyntaxError.new("You left out 'vs'. Hardly a war if you ask me.") unless first_option

    @first_option = first_option.gsub(Warsplitter::VERSUS, "").strip

    s.skip(Warsplitter::WHITESPACE)

    if s.check_until(Warsplitter::CONTEXT)
      @second_option = s.scan_until(Warsplitter::CONTEXT).not_nil!.gsub(Warsplitter::CONTEXT, "").strip
      @context = s.rest.strip
      raise Warsplitter::SyntaxError.new("If you want a context, you need to put something after the ';'.") if @context == ""
      return
    end

    @second_option = s.rest.strip
    raise Warsplitter::SyntaxError.new("Wars require more than one participant. Put something after the 'vs'.") if @second_option == ""
  end
end
