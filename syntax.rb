require "pp" #puts object class type

#  all type of data type and how to convert and round a.to_DataType
a = 10 + 10.3
a.to_s
b = "10.123"
b.to_f
b.to_i
name = "kch"

# how to print and join,if there are some special letter,can use '' or \
puts "hello #{name}"
puts "hello" + name
puts ' #{a}**#{b}'
puts "\#\{a\}**\#\{b\}"
# .inspect print with qutoes
puts "hello \n Ana"  #=> hello
#                         Ana
puts "hello \n Ana".inspect # => "hello \n Ana"
p "hello world!" # => "hello world!"
puts "hello world!"# => hello world!

# 正则表达式,refer https://www.rubyguides.com/2015/06/ruby-regex/

#string.scan(/./) /./ any one character; /../ any two characters;
# /\w/ any letter,digit,or uderscore;\d any digit; \s whitespace \n change line
# todo: learn regex [abc] , (a,b,c)
# #正则表达式：使用// 对文本进行搜索和高级操作
"this is a 4 test 123".scan(/\d/){|x| puts x}
"this is a 4 test 123".scan(/[aeiou]/){|x| puts x} # print only i i a e
"this is a test".scan(/[a-m]/){|x| puts x} # print letter between a-m
p "this is P"
p 1 == 1
# 方法一：Regexp.new and match()
re = Regexp.new 'Jane'
p "Jane is hot".match(re) #=> #<MatchData "Jane"> 部分匹配
# =~ /要匹配的字符/运算符将正则表达式与字符串进行完全匹配，如果找到匹配项，则返回匹配项与字符串的偏移量，否则返回 nil。
p "Jane is hot" =~ /Jane/ #=> o
# 锚点匹配给定文本内字符的位置。 我们介绍了三个锚定字符。 ^字符与行的开头匹配。 $字符与行尾匹配。 \b字符与单词边界匹配。
puts "Let us try ^"
puts p "Seven" =~ /^even/ #=> nil
puts p "Seven" =~ /^Seven/ #=> 0
#match vs =~
puts "Do you like cats?" =~ /like/ # => 7
if "Do you like cats?".match(/like/)
  puts "Match found!"
end

#方法二：使用.dot 匹配,/.even/常规模式查找以任意字符开头，后跟“偶数”字符的文本。
p "Seven".match /.even/# => <MatchData "Seven">
p "even".match /.even/# => nil
p "eleven".match /.even/ # => #<MatchData "leven">
p "proven".match /.even/ # => nil
p "even".match /.?even/ #<MatchData "even">  ?重复字符表明前一个字符可能出现 0 次或 1 次
puts "motherboard" =~ /board/ # => 6
puts "12, 911, 12, 111"[/\d{3}/]# find 三位数 => 911



p "meet big deep nil need".scan /.[e][e]./ # => ["meet", "deep", "need"]
p "This is Sparta!".split(/\s/) #找出是空格分隔的字符数组 =》["This", "is", "Sparta!"]

# 字符替换
# todo: 正则表达式替换
puts "foobarfoobar".sub('bar', 'foo') # foofoofoobar
puts "foobarfoobar".gsub('bar', 'foo') # foofoofoofoo
puts "motherboard".gsub /board/, "land" # => motherland #  正则表达式替换
puts "motherboard2".gsub("board","land")# => motherland2


# how to join two stings with commas or space
d = ["hello", name]
puts d.join(", ")
# array methods
e = [12, 375, 123, 53, 123, 745, 13]

puts e.max
puts e.sum
f = e.sum.to_f
g = f / e.length
g.round(2)
g.round 2

# lambada,block, Proc
y = 0
e.each { |x| y = x + y; puts y }


#编列数组的前三个值和index 可以用array[0..i] or array.slice(0, i)
# y = 0
e.each_with_index do |x, i|
  if i > 2
    break
  else
    y = x + y
  end
end
puts y
#方法二 使用inject(0) do |accumulator,x|
puts "let use inject"
sum = e[0..2].inject(0) do |y, x|
  y + x
end
puts sum

puts "Let us use slice"
sum2 = e.slice(0, 3).inject(0) do |y, x|
  y + x
end
puts sum2


# proc  block lamba（lamba 必须严格按照规定参数个数进行，blcok的调用用call（）
# myinc = Proc.new {|num| num + 1}
# # 或下面两种方式
# # myinc = proc {|num| num + 1}
# # myinc = lambda {|num| num + 1}
# # myinc = ->(numb){num +1 }
pr = Proc.new {|a,b| "#{a}**#{b}"}
puts pr.call("abc")

la = lambda { |a,b| "#{a}***#{b}"}
la2= -> (a,b) {"#{a}**#{b}"}
puts la.call("kch","ankun")



# Symbol :symbolName（string），不管调用几次都只会新建一次, 相同的 symbol， object_id 都是相同的
a = "dff"
s = :dff
pp a.to_sym #输出类型


# HASH key is symbol,
produce = {orange: 4,"apple": 2}
pp produce
pro2 = {"orange" => 4,"apple" => 2}
pp pro2
pro3 ={:orange => 4,:apple => 2}
pp pro3



# hash 作为最后一个参数可以省略 大括号
# ||= 写法 read database column once and save in a variable

# Could you create a method that with proc as a argument?
#Yes， &block 作为参数，然后block.call（）去执行。或者使用yield（parameter）表示要调用块，每写一个yield就是要调用一个块，其实就是将这个方法变成了块方法
# map method：return new array,each does not
def stupid
  yield
end
stupid { puts "kch is stupid!"}

stupid do
  puts "kch is doing"
end
def stupid2
  yield 5
  yield 7
end
stupid2 {|x| puts "test yield #{x}"}
# method 2 blcok equal yield
def stupid3(&block)
  block.call 3
end
stupid3 {|x| puts "test block.call method #{x}"}

#判断是否有块被执行
def stupid4
   if block_given?
     yield "Ankun"
     puts "BLock is given"
  else
    puts "it is nil"
  end
end
stupid4 {|x| puts x }


myinc = Proc.new {|num| num + 1 }
puts [1,2,3].map( &myinc )

# def method and call，if 是个class需要用ClassInstanceName.method
def mepro
  puts "abc"
end
mepro

#
# How to define a constant? what is a constant? why we need constant?always starts with a capital letter, cannot change

class RubyBlog

  URL = "abc.com"
  AUTHOR = "KCH"

  def puts_constant
    puts URL
  end
end
puts "Classes defined in #{RubyBlog}"
puts RubyBlog::URL #静态去调用类变量 ：： 代表命名空间
puts RubyBlog.const_get(:AUTHOR) #dynamtic 用const_get方法根据symbol的key去查找value
#遍历读取所有的变量values
["URL", "AUTHOR"].each do |name|
  puts RubyBlog.const_get(name)
end

#如何调用类的instance method，新建实例，然后.method
putsout = RubyBlog.new
putsout.puts_constant
# class method,可以通过类名 来调用，不能被instance实例 直接使用
# # class，class methods，instance methods
# What is global variable? how to define a global variable? $global_variable = 10
$global_v = 10

class Thing
  attr_accessor :ins_variable

  def initialize(ins_variable)
    @ins_variable = ins_variable
    puts"The wideth is: #{@ins_variable}"
    # class variables
    # store the numbers of objects created so far
    if defined?(@@number_of_things) #@@ class variable
      self.class.number_of_things_plus_one!
    else
      self.class.init_number_of_things!
    end
  end

  def self.number_of_things_plus_one!
    @@number_of_things += 1
  end

  def self.init_number_of_things!
    @@number_of_things = 1
  end

  def self.count
    @@number_of_things
  end

  # define class method with self. or Class.method
  def self.method
    $global_v2= "self def global"
    puts "This is a class method"
    puts "Global_v3 can be used everywhere, and the value is #{$global_v3}"
  end

  class << self

    def another_class_method
      puts "this is another class method"
    end

  end

  def area
    puts Thing.another_class_method
    puts self.class.another_class_method
    @ins_variable * @ins_variable
  end

  def squre(n)
    n * $global_v
    $global_v3= "instance def global"
  end

  def print_global_variable
    puts "Let us print global variable #{$global_v}"
  end
end


#call class method: Class.method; call instance method: Class.new.method

Thing.method
thing = Thing.new(3)
puts thing.area
thing2 = Thing.new(5)
thing_number = Thing.count
puts "The thing has bee created #{thing_number}"

puts thing.squre(2)
thing.print_global_variable
meth = thing.method(:squre)
puts meth.call(9)

# 一个方法名可以带问号吗？为什么 返回true or false

#puts RubyBlog?(:class)
def is_equal_10?(n)
  n == 10
end
puts is_equal_10?(9)

# 一个方法名可以带感叹号吗？为什么 can modified orgi  and return a new one
# without ! change once, but cannot change origi one
astring = "I AM A CAT"
astring.downcase!
puts astring
def remove_whitespace!(string)
  string.strip!

end
a = "  Green is beautiful!"
puts remove_whitespace!(a)
puts a



# %w(a b c) what does this mean?Percent Strings,% may create other types of object
# array of strings ["a","b","c"]
pp %w(a b c)
pp %i(student boy girl)
pp %q(a b c)
pp %w(abc def gh oo)
pp %w[ab cd ef]
#
#



# public, protected，private methods
# instance variable，class variable
# class inheritance
# @todo 重做测试，写几个好例子 谢谢
class ParentClass
  attr_accessor :name

  public
  def initialize(name)

    set_name(name)
  end


  public
  def name
    @first_name + ' ' + @last_name

  end

  def set_name(name)
    first_name,last_name = name.split(/\s+/)
    set_first_name(first_name) # cannot be used,because it is private method.
    set_last_name(last_name) # can be used,it is protected
  end

  private

  def set_first_name(name)
    @first_name = name
  end

  protected
  def set_last_name(name)
    @last_name = name
  end


end

p = ParentClass.new("Grace kang")

#y = ParentClass.new("Cindy Yu",8)

#puts y.age_difference_with(p)
#puts y.age
puts p.name
puts p.set_name("Cindy Yu")
puts p.name

# instance cannot call private method
# puts p.set_last_name("YU") # => private method `set_last_name' called fo
# puts p.set_first_name("Cindy") # => instance cannot call protected method
#puts p.set_name("Cindy Yu")

class ChildClass < ParentClass

  #overide name
  public
  def name
    "Child's name is NO2. " + super
    #puts "Child Name method can be used"
  end
end



my_mother = ParentClass.new("Grace kang")
my_child= ChildClass.new(my_mother.name)
puts my_child.name

# what is module
# how to use module，why we need module? what's the difference between module and class
# Modules are a way of grouping together methods, classes, and constants.
# 1.Modules provide a namespace and prevent name clashes.
# 2.Modules implement the mixin facility.
# @todo Please give me an example.
module Shape
  PI = 3.1415
  class Circle
    attr_accessor :r

    def perimeter(r)
      @r = r
      2 * PI * @r

    end
  end
  #define moudleName.method
  class Square
    attr_accessor :width
    def perimeter(width)
      @width =width
      4 * @width

    end

  end


end
cir = Shape::Circle.new

puts cir.perimeter(2)
squ = Shape::Square.new
puts squ.perimeter(5)
