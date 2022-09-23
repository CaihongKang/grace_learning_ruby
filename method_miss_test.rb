# how to write a dynamic method? could you implement a "method_missing" method?
# Responding to Calls to Undefined Methods
# What kind of situation can you use "method_missing"?
class MyClass
  attr_accessor :object

  def initialize(object)
    self.object = object
  end

  def defined_method
    puts 'This method is defined.'
  end

  def method_missing(m, *args, &block)
      puts "Sorry, I don't know about any #{m} method."
      object.send(m, *args, &block)
  end

end

#my.undefined_method

class UserClass < MyClass


  def last_name
    "#{object.last_name}."
  end

  def full_name
    "#{object.first_name} #{object.last_name}"
  end


end
#A Struct is a convenient way to bundle a number of attributes together, using accessor methods, without having to write an explicit class.

User = Struct.new(:first_name, :last_name, :age)
user = User.new("Grace", "Kang", 30)
user_presenter = UserClass.new(user)
puts user_presenter.first_name
puts user_presenter.age


