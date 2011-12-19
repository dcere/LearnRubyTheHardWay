## Animal is-a object (yes, sort of confusing)
class Animal

end

## is-a (Dog is an animal)
class Dog < Animal

   def initialize(name)
      ## has-a
      @name = name
   end
   
end

## is-a (Cat is an animal)
class Cat < Animal

   def initialize(name)
      ## has-a
      @name = name
   end

end

## is-a Object
class Person

   attr_accessor :pet
   
   def initialize(name)
      ## has-a
      @name = name
      
      ## Person has-a pet of some kind
      @pet = nil
   end

end

## is-a (Employee is a Person)
class Employee < Person

   def initialize(name, salary)
      ## has-a name
      super(name)
      ## has-a salary
      @salary = salary
   end

end

## is-a Object
class Fish

end

## is-a (Salmon is a fish)
class Salmon < Fish

end

## is-a (Halibut is a Fish)
class Halibut < Fish

end

## rover is-a Dog
rover = Dog.new("Rover")

## satan is a cat
satan = Cat.new("Satan")

## mary is a person
mary = Person.new("Mary")

## mary has a cat
mary.pet = satan

## frank is an employee
frank = Employee.new("Frank",120000)

## frank has a dog
frank.pet = rover

## flipper is a fish
flipper = Fish.new

## crouse is a salmon
crouse = Salmon.new

## harry is an halibut
harry = Halibut.new
