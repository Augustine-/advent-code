=begin
  --- Part One ---

  Santa is trying to deliver presents in a large apartment building,
  but he can't find the right floor -
  the directions he got are a little confusing.
  He starts on the ground floor (floor 0) and then follows the instructions one
  character at a time.

  An opening parenthesis, (, means he should go up one floor,
  and a closing parenthesis, ), means he should go down one floor.

  The apartment building is very tall, and the basement is very deep;
  he will never find the top or bottom floors.

  To what floor do the instructions take Santa?

  -- Augustine's Notes --

  My first thought was to iterate over the string, incrementing or decrementing
  a 'floor' variable depending on what symbol I found. After a moment, I realised
  how silly and wasteful that would be, and opted to find the difference between
  the total number of 'up' and 'down' instructions.

=end

instructions = File.read('day-1-input.txt')
instructions = instructions.strip.split('')
instructions.count('(') - instructions.count(')')

# more efficient

floor = 0
instructions.each_with_index do |instruction, index|
  instruction == "(" ? floor += 1 : floor -= 1
end

p floor


=begin
  --- Part Two ---

  Now, given the same instructions,
  find the position of the first character that causes him to enter the basement
  (floor -1). The first character in the instructions has position 1,
  the second character has position 2, and so on.

  What is the position of the character
  that causes Santa to first enter the basement?

  -- Augustine's Notes --

  Funny enough, the approach I considered too naieve for the first part would
  work well enough here. We just break the iterations once the desired result is
  found.

=end

floor = 0

instructions.each_with_index do |instruction, index|
  if floor < 0
    puts index
    break
  end

  instruction == "(" ? floor += 1 : floor -= 1
end
