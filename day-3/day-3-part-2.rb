=begin
--- Part Two ---

  The next year, to speed up the process,
  Santa creates a robot version of himself,
  Robo-Santa, to deliver presents with him.

  Santa and Robo-Santa start at the same location (
  delivering two presents to the same starting house),
  then take turns moving based on instructions from the elf,
  who is eggnoggedly reading from the same script as the previous year.

  This year, how many houses receive at least one present?

  For example:

  ^v delivers presents to 3 houses,
  because Santa goes north, and then Robo-Santa goes south.

  ^>v< now delivers presents to 3 houses,
  and Santa and Robo-Santa end up back where they started.

  ^v^v^v^v^v now delivers presents to 11 houses,
  with Santa going one direction and Robo-Santa going the other.


  -- Augustine's notes --

  I'll add a second set of coordinates and an array to track robo-santa.
  I'll also add a conditional to the .each loop, which adds the coords to the
  appropriate array.

  Just think, there are an infinite amount of houses that didn't get gifts. ='[
=end

instructions = File.read("day-3-input.txt")
instructions = instructions.strip.split('')

santa_coordinates = []
x = 0
y = 0

robo_santa_coordinates = []
r_x = 0
r_y = 0

instructions.each_with_index do |direction, index|
  if index.even? || index == 0
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
  else
    case direction
    when ">"
      r_x += 1
    when "v"
      r_y -= 1
    when "<"
      r_x -= 1
    when "^"
      r_y += 1
    end

    robo_santa_coordinates << [r_x, r_y]
  end
end

p (santa_coordinates | robo_santa_coordinates).length
