=begin
  --- Part Two ---

  Now find one that starts with six zeroes.

  -- Augustine's Notes --

  How ominous. If that isn't hinting at an exponential increase in difficulty,
  I don't know what is. I'm going to try the same approach as part 1,
  but it feels dirty.

  Yup, it worked. Took 28.376 seconds, but it worked. There's gotta be a better
  way...

=end

require 'digest'


hash = ''
i = 1

until hash[0...6] == "000000"
  key = 'yzbqklnj' + i.to_s

  hash = Digest::MD5.hexdigest(key)
  i += 1
end
p hash
p i - 1
