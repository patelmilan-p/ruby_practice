animal = 'dog'


class << animal
end

#animal.instance_eval { def self.speak; puts "Dog says woof!"; end}

module Animal
  def speak
    puts "Dog says woof!"
  end
end

#animal.extend(Animal)

#include Animal

animal.send :define_singleton_method, :speak, lambda { puts "Dog says woof!" }

animal.speak
