#require './Circle' # load file Circle.rb by （绝对路径）
require_relative "Circle" #load searching 当前目录 相对路径
require "pp"
class Shape
  def initialize(a,b)
    @a = a
    @b = b
  end
  def compare_area_difference
    puts "let us compare the area difference!"
    (@a.area - @b.area).abs


  end

end

circle_shape1 = Circle.new(2)
circle_shape2 = Circle.new(3)
shape_circle = Shape.new(circle_shape1,circle_shape2)
puts shape_circle.compare_area_difference
#puts shape_bject.compare_area_difference
puts circle_shape1.area
puts circle_shape2.area
