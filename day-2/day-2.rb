=begin
  --- Day 2: I Was Told There Would Be No Math ---

  The elves are running low on wrapping paper, and so they need to submit an order
   for more. They have a list of the dimensions (length l, width w, and height h)
    of each present, and only want to order exactly as much as they need.

  Fortunately, every present is a box (a perfect right rectangular prism),
  which makes calculating the required wrapping paper for each gift a little
  easier: find the surface area of the box, which is 2*l*w + 2*w*h + 2*h*l.
  The elves also need a little extra paper for each present:
  the area of the smallest side.

  For example:

  A present with dimensions 2x3x4 requires 2*6 + 2*12 + 2*8 = 52 square feet of
  wrapping paper plus 6 square feet of slack, for a total of 58 square feet.
  A present with dimensions 1x1x10 requires 2*1 + 2*10 + 2*10 = 42 square feet of
  wrapping paper plus 1 square foot of slack, for a total of 43 square feet.

  All numbers in the elves' list are in feet.
  How many total square feet of wrapping paper should they order?

  -- Augustine's Notes --

  So this consists of parsing the dimensions of the boxes from strings in the
  format 'X'*'Y'*'Z', and doing two things.

  First, find the smallest product of any combination of two unique factors.
  XY, XZ, YZ. We'll write a method to do this.

  Second, simply plug the variables into the formula given for determining the
  surface area of a right rectangular prism. Another method here.

  Add the results from the above methods, and you've got your sub-answer.
  Increment a total square footage variable by the amount per package,
  and you've got your final answer!

=end

instructions = File.open("day-2-input.txt").readlines.map(&:strip)

def parse_dimensions(str)
  strs = str.split('x')
  strs.map(&:to_i)
end

def area_of_smallest_side(dimensions)
  dimensions.sort!
  dimensions[0] * dimensions[1]
end

def surface_area(dimensions)
  length = dimensions[0]
  width  = dimensions[1]
  height = dimensions[2]

  (2 * length * width) + (2 * width * height) + (2 * height * length)
end


parsed_dimensions = []
sqft_of_wrapping_paper = 0

instructions.each do |instruction|
  parsed_dimensions << parse_dimensions(instruction)
end

parsed_dimensions.each do |dimensions|
  slack = area_of_smallest_side(dimensions)
  sqft = surface_area(dimensions)
  sqft_of_wrapping_paper += (sqft + slack)
end

p sqft_of_wrapping_paper


=begin
  --- Part Two ---

  The elves are also running low on ribbon.
  Ribbon is all the same width,
  so they only have to worry about the length they need to order,
  which they would again like to be exact.

  The ribbon required to wrap a present is the shortest distance around its sides,
  or the smallest perimeter of any one face.
  Each present also requires a bow made out of ribbon as well;
  the feet of ribbon required for the perfect bow is equal to the cubic feet of volume of the present.
  Don't ask how they tie the bow, though; they'll never tell.

  For example:

  A present with dimensions 2x3x4 requires 2+2+3+3 =
  10 feet of ribbon to wrap the present plus 2*3*4 =
  24 feet of ribbon for the bow, for a total of 34 feet.

  A present with dimensions 1x1x10 requires 1+1+1+1 =
  4 feet of ribbon to wrap the present plus 1*1*10 =
  10 feet of ribbon for the bow, for a total of 14 feet.

  How many total feet of ribbon should they order?

  -- Augustine's Notes --

  The first half of this problem is to find the smallest side.
  After we do that, it's another formula. L + L + W + W, or L2 + W2.

  Second half is to run another formula, L * W * H.
  Part two seems to be easier than part one!

=end

def perimeter_of_smallest_side(dimensions)
    dimensions.sort!
    (dimensions[0] * 2) + (dimensions[1] * 2)
end

def cubic_feet(dimensions)
  dimensions[0] * dimensions[1] * dimensions[2]
end

sqft_of_ribbon = 0

parsed_dimensions.each do |dimensions|
  wrapping = perimeter_of_smallest_side(dimensions)
  bow = cubic_feet(dimensions)

  sqft_of_ribbon += (wrapping + bow)
end

p sqft_of_ribbon
