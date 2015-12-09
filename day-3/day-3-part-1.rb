=begin

  --- Day 3: Perfectly Spherical Houses in a Vacuum ---

  Santa is delivering presents to an infinite two-dimensional grid of houses.

  He begins by delivering a present to the house at his starting location,
  and then an elf at the North Pole calls him via radio and tells him where to move next.
   Moves are always exactly one house to the north (^), south (v), east (>), or west (<).
   After each move, he delivers another present to the house at his new location.

  However, the elf back at the north pole has had a little too much eggnog,
  and so his directions are a little off,
  and Santa ends up visiting some houses more than once.

  How many houses receive at least one present?

  For example:

  > delivers presents to 2 houses: one at the starting location, and one to the east.

  ^>v< delivers presents to 4 houses in a square, including twice to the house at his starting/ending location.

  ^v^v^v^v^v delivers a bunch of presents to some very lucky children at only 2 houses.


  -- Augustine's Notes --

  This sounds similar to the tall building Santa was dealing with on day 1.

  My first instinct was to make a 'houses_delivered' variable...

  But that doesn't seem necessary.

  What if we treat the infinite suburbia as the grid that it is,
  using an X and Y value to determine how far along santa gets.

  By plotting Santa's position over time,
  using a 2-dimensional array to keep track of his coordinates,
  we can remove all unique coords from that array and find the number of unique
  houses visited as the length of that array. That's a bingo!


=end

instructions = File.read("day-3-input.txt")
instructions = instructions.strip.split('')

santa_coordinates = []
x = 0
y = 0

instructions.each do |direction|
  case direction
  when ">"
    x += 1
  when "v"
    y -= 1
  when "<"
    x -= 1
  when "^"
    y += 1
  end

  santa_coordinates << [x, y]
end

santa_coordinates.uniq!
p santa_coordinates.length

# Part Two is in a seprate file.
