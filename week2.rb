# how to write multiple classes in two ruby files and call each


# how to use require, require_relative
#

# What is YAML, how to write a yaml file, please give me an example that yaml contains, hash, array etc
#Saving/Retrieving Data
require 'yaml'
# Writing an array to a yaml file
pets = ["dog", "cat", "hamster"]
File.open("pets.yml", "w") { |file| file.write(pets.to_yaml) }
#Retrieving the array

pet_array = YAML.load(File.read("pets.yml"))
p pet_array #=> ["dog", "cat", "hamster"]


# how to access value of a key from a hash?
# # please write a example hash contains nested hash, how to access 2nd level value?
# # what is method fetch? or dig?
recipe = { title: "make coffee",
           ingredients: [{ingredient_name: "Water", quantity_g: 8},{ingredient_name: "coffee beans", quantity_g: 10} ],
           steps: { step1: "mix together and boil" },
           every_step_time_use: {step1:[10,1,6]}

}
File.open("recipe.yaml", "w") { |file| file.write(recipe.to_yaml)}
recipe_from_yaml = YAML.load(File.read("recipe.yaml"))
pp recipe_from_yaml

recipe[:time_use_min] = 10 #add one more key to hash
pp recipe[:steps] # => {:step1=>"mix together and boil"}
pp recipe[:steps][:step1] # => "mix together and boil"
# dig nested hash
pp recipe.dig(:steps, :step1)  # => "mix together and boil"
pp recipe.dig(:every_step_time_use, :step1,2) #=> 6
pp recipe.dig(:ingredients, 1, :ingredient_name) #=> "coffee beans"

# hash.fetch() 如果没有找到相关的key，会报错，所以应该加上block或者设置default
pp recipe.fetch(:name) {|key| "no key #{key}"} # =>"no key name"
pp recipe.fetch(:steps) {|key| "no key #{key}"} # => {:step1=>"mix together and boil"}



#
# how to raise exception? how to define a customized exception? please give an example.
#def inverse(x)
 #12/x
 #raise ArgumentError unless x.is_a?  #catch an exception
#end
#inverse("b")

begin
  12/"a"

  raise " Catcha an exception!"

rescue StandardError => e # ignore an exception and continue to return value?
  puts e.message
  puts e.backtrace.inspect
  puts "please input interger!"
ensure
  puts 'Ensuring execution!'

end
#To make a custom exception, just create a new class that inherits from StandardError.

class PermissionDeniedError < StandardError

  attr_reader :action

  def initialize(message, action)
    # Call the parent's constructor to set the message
  super(message)

  # Store the action in an instance variable
  @action = action
  end

end

raise PermissionDeniedError.new("Permission Denied", :delete)

# how to catch an exception? how to ignore an exception and continue to return value?

# how to make sure a line of code will be called no matter if this method is raising an exception?
#use ensure.

# how to write a dynamic method? could you implement a "method_missing" method?
# Responding to Calls to Undefined Methods
# What kind of situation can you use "method_missing"?
class MyClass
  def defined_method
    'This method is defined.'
  end
  def method_missing(m, *args)
    "Sorry, I don't know about any #{m} method."
  end
end

my = MyClass.new
my.undefined_method

#当一个类被调用方法未找到时,该类的method_missing(name,*args,&block)方法会被自动调
#
# how to create and write a file through ruby logic? how to read a file?
#
#Common modes for File Handling
 #“r” : Read-only mode for a file.
 # “r+” : Read-Write mode for a file.
 # “w” : Write-only mode for a file.
 # “w+” : Read-Write mode for a file.
 # “a” : Write-only mode, if file exists it will append the data otherwise a new file will be created.
 # “a+” : Read and Write mode, if file exists it will append the data otherwise a new file will be created.
#
## Creating a file

file_txt_object = File.new("moreshape.txt","w+")

# Writing to the file
file_txt_object.syswrite("File Headling!\n Second lines!")

# Closing a file
file_txt_object.close()

#how to read a file?
#1. fileobject.sysread(20) – Return only the first 20 characters from that file
#2. fileobject.read – Return the entire content from a file
#3. fileobject.readlines – Return the values as an array of lines
file_read_object = File.new("moreshape.txt","r")
puts file_read_object.read  #=> File Headling!
                               #Second lines!
file_read_object.close()

file_read_object2 = File.new("moreshape.txt","r")
puts file_read_object2.sysread(5) #=> File
puts file_read_object2.readlines  #=> 输出两行
file_read_object2.close()

