class Whiteboard
  attr_accessor :contents

  def initialize(contents = [])
    @contents = contents
  end

  def erase
    @contents = []
  end
end

class DryEraseMarker
  attr_reader :color, :capacity
  def initialize(color)
    @color = color
    @capacity = 100
  end

  INK_USE_PER_CHARACTER = 0.01
  def write(contents, whiteboard)
    if @capacity >= 0.01
      @capacity = @capacity - (INK_USE_PER_CHARACTER * contents.length)
      whiteboard.contents << contents
    else
      return false
    end
  end
end

whiteboard = Whiteboard.new
black_marker = DryEraseMarker.new('black')

puts black_marker.write('Hello Launchers', whiteboard)
puts black_marker.write('My name is Slim Shady', whiteboard)

puts "----"

puts whiteboard.contents

whiteboard.erase
puts "---- just erased"
puts whiteboard.contents
puts black_marker.write('Hi', whiteboard)

#puts black_marker.write('hi', whiteboard)

# puts black_marker.inspect
# puts whiteboard.inspect