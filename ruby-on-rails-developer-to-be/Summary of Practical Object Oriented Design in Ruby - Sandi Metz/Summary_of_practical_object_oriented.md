# Practical Object Oriented Design in Ruby

## Terminology

### SOLID Principles

- Single Responsibility
- Open Closed
- Liskov Substitution

  " Let q(x) be a property provable about objects x of type T. Then q(y)
  should be true for objects y of type S where S is a subtype of T. "

  Following this principle creates applications where a subclass can be used anywhere its superclass would do, and where objects that include modules can be trusted to interchangeably play the module’s role. In Ruby terms this means that an object should act like what it claims to be.

- Interface Segregation
- Dependency Inversion

### DRY (Dont Repeat Your Self)

### LoD (Law of Demeter)

a set of coding rules that results in loosely coupled objects.

Demeter is often paraphrased as “only talk to your immediate neighbors” or “use only one dot.”

One common way to remove “train wrecks” from code is to use delegation to avoid the “dots.”

This is Bad :
=> Why? because it like a chain

```ruby
customer.bicycle.wheel.rotate;
```

This is Good:
=> Why? hash.keys returns an Enumerable; hash.keys.sort also returns an Enumerable hash.keys.sort.join returns a String. All of it return Enumerable of Strings

```ruby
hash.keys.sort.join
```

How to fix LOD violation
=> Use wrapper or method (verb)

```ruby
customer.ride to customer.depart or customer.go
```

### Polymorphism

Polymorphism in OOP refers to the ability of many different objects to respond to the same message. Senders of the message need not care about the class of the receiver; receivers supply their own specific version of the behavior.

### Metaprogramming

Metaprogramming (i.e., writing code that writes code)

## Chapter 1: Object Oriented Design

- Your application design will always change
- Your code should be easily to change in the future
- BUFD (Big Up Front Design) in Agile development is about designing for future feature and change that might be happen
- It's all about to have lowest cost software design per feature
- it's not about SLOC (Source Lines of Code) but how well your code follow the principles

## Chapter 2: Designing Class with Single Responsibilty

- The foundation of the OO system is _message_, but the most visible is _class_
- Grouping Methods into classes
- A class should do the smallest possible useful thing; that is, it should have a single responsibility.

### Easy to change (TRUE) principles

- Transparent: The consequences of change should be obvious in the code that ischanging and in distant code that relies upon it
- Reasonable: The cost of any change should be proportional to the benefits thechange achieves
- Usable: Existing code should be usable in new and unexpected contexts
- Exemplary: The code itself should encourage those who change it to perpetuatethese qualities

### Simple Gear Class

Problem :
Bicycles are wonderfully efficient machines, in part because they use gears to provide humans with mechanical advantage.

Nouns:
Bicycle and Gear

> These nouns represent the simplest candidates to be classes

```ruby

class Gear
  attr_reader chainrings, cog
  def initialize(chainrings, cog)
    @chainrings = chainrings
    @cogs = cog
  end

  def ratio
    chainrings / cog
  end
end

puts Gear.new(52, 11).ratio
puts Gear.new(30, 27).ratio


```

### Why Single Responsibilities Matter

You want to reuse your class, and it should has only one responsibility

### Basic code rule

- **Hide instance variable (use attr_reader || attr_writer || attr_accessor )**
- **Wrap variable in a method like this one**

```ruby
# default implementation via attr_reader
def cog
  @cog
end

# a more complex one
def cog
  @cog * (foo? ? bar_adjustment : baz_adjustment)
end
```

- **Use struct so it will become known**

```ruby
class RevealingReferences
  attr_reader :wheels

  def initialize(data)
    @wheels = wheelify(data)
  end

  def diameters
    wheels.collect {|wheel|
      wheel.rim + (wheel.tire * 2)}
  end

  # ... now everyone can send rim/tire to wheel
  Wheel = Struct.new(:rim, :tire)

  def wheelify(data)
  data.collect {|cell| Wheel.new(cell[0], cell[1])}
  end
end

```

- **Expose previously hidden qualities**
  Refactoring a class so that all of its methods have a single responsibility has a clarifying effect on the class. Even if you do not intend to reorganize the methods into other classes today, having each of them serve a single purpose makes the set of things the class does more obvious.
- **Avoid the need for comments**
  How many times have you seen a comment that is out of date? Because comments are not executable, they are merely a form of decaying documentation. If a bit of code inside a method needs a comment, extract that bit into a separate method. The new method name serves the same purpose as did the old comment.
- **Encourage reuse**
  Small methods encourage coding behavior that is healthy for your application. Other programmers will reuse the methods instead of duplicat- ing the code. They will follow the pattern you have established and create small, reusable methods in turn. This coding style propagates itself.
- **Are easy to move to another class**
  When you get more design information and decide to make changes, small methods are easy to move. You can rearrange behavior without doing a lot of method extraction and refactoring. Small methods lower the barriers to improving your design.

### How about Refactor it

It's very good to keep your class has one responsibilty

```ruby
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel=nil)
    @chainring = chainring
    @cog       = cog
    @wheel     = wheel
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end

@wheel = Wheel.new(26, 1.5) puts @wheel.circumference # -> 91.106186954104
puts Gear.new(52, 11, @wheel).gear_inches # -> 137.090909090909
puts Gear.new(52, 11).ratio # -> 4.72727272727273

```

## Chapter 3 : Managing Dependencies

"a class should depend only on classes that change less often than it does"

Every object is Single Responsibility, so to able create bigger task every object need to interact with each other.

An object has a dependency when it knows :

- **The name of another class**.
  For example, Gear expects a class named Wheel to exist.
- **The name of a message that it intends to send to someone other than self**.
  For example, Gear expects a Wheel instance to respond to diameter.
- **The arguments that a message requires**.
  For example, Gear knows that Wheel.new requires a rim and a tire.
- **The order of those arguments**.
  For example, Gear knows the first argument to Wheel.new should be rim, the second, tire.

### Dependency Injection

Make the class know less and can collaborate with other class that has same method

```ruby

class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel)
          @chainring = chainring
          @cog       = cog
          @wheel     = wheel
  end

  def gear_inches
    ratio * wheel.diameter
  end
# ...
end

class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end

# Gear expects a ‘Duck’ that knows ‘diameter’
# Gear previously had explicit dependencies on the Wheel class and on the type and order of its initialization arguments,
# but through injection these dependencies have been reduced to a single dependency on the diameter method. Gear is now smarter because it knows less.

Gear.new(52, 11, Wheel.new(26, 1.5)).gear_inches

```

### Isolate Dependency

In a big code house, you can't change the code and create a perfect code.
If you cannot remove unnecessary dependency just isolate it

- **Create instance variable for the dependency**
- **Create method for the dependency**

```ruby
# First option
class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @wheel = Wheel.new(rim, tire)
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

# Second Option
class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog       = cog
    @rim       = rim
    @tire      = tire
  end

  def gear_inches
    ratio * wheel.diameter
  end

  def wheel
    @wheel ||= Wheel.new(rim, tire)
  end
end

```

- **Also isolate it to different method**

```ruby

# and then
def gear_inches
  #... a few lines of scary math
  foo = some_intermediate_result * diameter #... more lines of scary math
end

def diameter
  wheel.diameter
end

```

- **Use hash to remove order dependencies**
- **Use explicitly define value**

```ruby
class Gear
attr_reader :chainring, :cog, :wheel

  def initialize(args)
    @chainring = args[:chainring] || 40
    @cog = args[:cog] || 18
    @wheel     = args[:wheel]
  end
...
end

Gear.new(
  chainring: 52,
  cog: 11,
  wheel: Wheel.new(26, 1.5)).gear_inches

```

- **Use module to isolate multiparameter initialization**
  In some cases you cannot change the order dependencies, so you need to find new way that it can fix

```ruby

#When Gear is part of an external interface
module SomeFramework
  class Gear
    attr_reader :chainring, :cog, :wheel

    def initialize(chainring, cog, wheel)
      @chainring = chainring
      @cog       = cog
      @wheel     = wheel
    end
# ...
  end
end

module GearWrapper
  def self.gear(args)
    SomeFramework::Gear.new(args[:chainring], args[:cog], args[:wheel])
  end
end

Gear.new(
  chainring: 52,
  cog: 11,
  wheel: Wheel.new(26, 1.5)).gear_inches

```

- **You cannot ommit dependencies but You can design object with less dependency**

![Dependencies vs Likehood to Change](https://miro.medium.com/max/360/0*AVYPNk1AD4X3dMI1.jpg)

## Chapter 4 : Creating Flexible Interfaces

"It deals not only with what objects know (their responsibilities) and who they know (their dependencies), but how they talk to one another."

"The design goal, as always, is to retain maximum future flexibility while writing only enough code to meet today’s requirements."

- **Start to worry about "I need to send this message, who should respond to it?", rather than "I know I need this class, what should it do?"**

- **Trusting other objects, class should not know many details about method in other classes and just care about the response**

- **In the process you will find other objects**

### Public Interfaces must be stable

The methods that make up the public interface of your class comprise the face it presents to the world. They:
• Reveal its primary responsibility
• Are expected to be invoked by others
• Will not change on a whim
• Are safe for others to depend on
• Are thoroughly documented in the tests

Every time you create a class, declare its interfaces. Methods in the public
interface should :
• Be explicitly identified as such
• Be more about what than how
• Have names that, insofar as you can anticipate, will not change • Take a hash as an options parameter

### Private Interfaces can be change, but cannot be depended

All other methods in the class are part of its private interface. They:
• Handle implementation details
• Are not expected to be sent by other objects • Can change for any reason whatsoever
• Are unsafe for others to depend on
• May not even be referenced in the tests

"Depending on a private interface increases risk; keep this risk to a minimum by isolating the dependency."

## Chapter 5 : Reducing Cost with Duck Typing

"Duck types are public interfaces that are not tied to any specific class"

"When interface between class is too much, try create another class between them, so the interface can be fewer"

"Messages are at the center of object-oriented applications and they pass among objects along public interfaces."

Before duck typing

```ruby
# Trip preparation becomes more complicated
class Trip
  attr_reader :bicycles, :customers, :vehicle
  def prepare(preparers)
    preparers.each {|preparer|
      case preparer
      when Mechanic
        preparer.prepare_bicycles(bicycles)
      when TripCoordinator
        preparer.buy_food(customers)
      when Driver
        preparer.gas_up(vehicle)
        preparer.fill_water_tank(vehicle)
      end
    }
  end
end
        # when you introduce TripCoordinator and Driver
class TripCoordinator
  def buy_food(customers)
  # ...
  end
end

class Driver
  def gas_up(vehicle)
  #...
  end
  def fill_water_tank(vehicle)
  #...
  end
end
```

After duck typing

```ruby
# Trip preparation becomes easier
class Trip
  attr_reader :bicycles, :customers, :vehicle

  def prepare(preparers)
    preparers.each {|preparer|
      preparer.prepare_trip(self)}
    end
  end
  # when every preparer is a Duck # that responds to ‘prepare_trip’
  class Mechanic
    def prepare_trip(trip)
      trip.bicycles.each {|bicycle|
                prepare_bicycle(bicycle)}
    end
  end
  # ...
end

class TripCoordinator
  def prepare_trip(trip)
    buy_food(trip.customers)
  end
# ...
end

class Driver
  def prepare_trip(trip)
    vehicle = trip.vehicle
    gas_up(vehicle)
    fill_water_tank(vehicle)
  end
# ...
end
```

Other option

kind_of? => check if the input is synonymous in term of the class/object

```ruby
if preparer.kind_of?(Mechanic)
  preparer.prepare_bicycles(bicycle)
elsif preparer.kind_of?(TripCoordinator)
  preparer.buy_food(customers)
elsif preparer.kind_of?(Driver)
  preparer.gas_up(vehicle)
  preparer.fill_water_tank(vehicle)
end
```

responds_to? => check if the input has the self.method

```ruby
if preparer.responds_to?(:prepare_bicycles)
  preparer.prepare_bicycles(bicycle)
elsif preparer.responds_to?(:buy_food)
  preparer.buy_food(customers)
elsif preparer.responds_to?(:gas_up)
  preparer.gas_up(vehicle)
  preparer.fill_water_tank(vehicle)
end
```

## Chapter 6 : Acquiring Behavior Through Inheritance

"Create Abstract Superclass to define more detailed subclasses"

"The creation of hierarchy of class (inheritance) is really depend on the situation, if the situation is not clear enough so it might not be needed"

"The general rule for refactoring into a new inheritance hierarchy is to arrange code so that you can promote abstractions rather than demote concretions."

"We should manage coupling between superclasses and subclasses"

"We can use hook messages to refactoring coupling between superclasses and subclasses"

```ruby
class Bicycle
  attr_reader :size, :chain, :tire_size
  def initialize(args={})
    @size = args[:size]
    @chain = args[:chain] || default_chain @tire_size = args[:tire_size] || default_tire_size
    post_initialize(args)
  end

  def spares
    { tire_size: tire_size,
      chain: chain}.merge(local_spares)
  end

  def default_tire_size
    raise NotImplementedError
  end

  # subclasses may override this method
  def post_initialize(args)
    nil
  end

  # subclasses may also override this method
  def local_spares
    {}
  end

  def default_chain
    '10-speed'
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def post_initialize(args)
    @tape_color = args[:tape_color]
  end

  def local_spares
    {tape_color: tape_color}
  end

  def default_tire_size
    '23'
  end
end

class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def post_initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
  end

  def local_spares
    {rear_shock: rear_shock}
  end

  def default_tire_size
    '2.1'
  end
end

# If you add the other subclass

class RecumbentBike < Bicycle
  attr_reader :flag

  def post_initialize(args)
    @flag = args[:flag]
  end

  def local_spares
    {flag: flag}
  end

  def default_chain
    "9-speed"
  end

  def default_tire_size
    '28'
  end
end

bent = RecumbentBike.new(flag: 'tall and orange') bent.spares

# -> {:tire_size => "28",
# :chain => "9-speed",
#     :flag      => "tall and orange"}

```

## Chapter 7 : Sharing Role Behavior with Modules

" Many object-oriented languages provide a way to define a named group of methods that are independent of class and can be mixed in to any object. In Ruby, these mix-ins are called modules. "

" Letting Objects Speak for Themselves. If your interest is in object B, you should not be forced to know about object A if your only use of it is to find things out about B. So object should be able to manage themselves "

" Module should be able contain abstraction of objects "

" Including a module into a class adds the module’s methods to the response set for all instances of that class (Superclass and Class). "

" Writing code that requires subclasses to send super adds an additional dependency; avoid this if you can (Using Hook Method). But you cannot have many levels of hierarchy "

" Always create shallow hierarchies. Shallow, narrow hierarchies are easy to understand."

### Writing Inheritable Code

- Recognize the Antipatterns

  First, an object that uses a variable with a name like type or category to determine what message to send to self contains two highly related but slightly different types. This rearrangement allows you to create new subtypes by adding new subclasses.
  Second, when a sending object checks the class of a receiving object to determine what message to send, you have overlooked a duck type. In addition to sharing an interface, duck types might also share behavior. When they do, place the shared code in a module and include that module in each class or object that plays the role.

- Insist on the Abstraction

  All of the code in an abstract superclass should apply to every class that inherits it. Superclasses should not contain code that applies to some, but not all, subclasses. This restriction also applies to modules: the code in a module must apply to all who use it.

- Honor the Contract

  Subclasses agree to a contract; they promise to be substitutable for their superclasses. Substitutability is possible only when objects behave as expected and subclasses are expected to conform to their superclass’s interface.
  Subclasses that fail to honor their contract are difficult to use. They’re “special” and cannot be freely substituted for their superclasses. These subclasses are declaring that they are not really a kind-of their superclass and cast doubt on the correctness of the entire hierarchy.

```ruby
#before implementation modules

class Schedule
  def scheduled?(schedulable, start_date, end_date)
    puts "This #{schedulable.class} " +
         "is not scheduled\n" +
         " between #{start_date} and #{end_date}"
    false
  end
end

class Bicycle
  attr_reader :schedule, :size, :chain, :tire_size

  # Inject the Schedule and provide a default
  def initialize(args={})
    @schedule = args[:schedule] || Schedule.new # ...
  end

  # Return true if this bicycle is available
  # during this (now Bicycle specific) interval.
  def schedulable?(start_date, end_date)
    !scheduled?(start_date - lead_days, end_date)
  end

  # Return the schedule's answer
  def scheduled?(start_date, end_date)
    schedule.scheduled?(self, start_date, end_date)
  end

  # Return the number of lead_days before a bicycle # can be scheduled.
  def lead_days
    1
  end
# ...
end

require 'date'
starting = Date.parse("2015/09/04")
ending = Date.parse("2015/09/10")

b = Bicycle.new b.schedulable?(starting, ending)
# This Bicycle is not scheduled
# between 2015-09-03 and 2015-09-10 # => true

```

```ruby
# after modules implementation

module Schedulable
  attr_writer :schedule

  def schedule
    @schedule ||= ::Schedule.new
  end

  def schedulable?(start_date, end_date)
    !scheduled?(start_date - lead_days, end_date)
  end

  def scheduled?(start_date, end_date)
    schedule.scheduled?(self, start_date, end_date)
  end

  # includers may override
  def lead_days
    0
  end
end

class Bicycle

  include Schedulable

  def lead_days
    1
  end
# ...
end

require 'date'

starting = Date.parse("2015/09/04")
ending = Date.parse("2015/09/10")
b = Bicycle.new b.schedulable?(starting, ending)
# This Bicycle is not scheduled
# between 2015-09-03 and 2015-09-10 # => true


class Vehicle
  include Schedulable

  def lead_days
    3
  end
# ...
end

class Mechanic
  include Schedulable

  def lead_days
    4
  end
# ...
end

v = Vehicle.new v.schedulable?(starting, ending)
# This Vehicle is not scheduled
# between 2015-09-01 and 2015-09-10 # => true

m = Mechanic.new m.schedulable?(starting, ending)
# This Mechanic is not scheduled
# between 2015-02-29 and 2015-09-10 # => true

```

## Chapter 8 : Combining Objects with Composition

- Composition is a technique to combining very small independent objects (The sum of it's parts), that communicate through well defined interface.

- Using Composition (has-a relationship) is better when more parts an object has.

- Benefit of Composition is having small objects that have a single responsibility and specify their own behavior. But it has cost, because while every individual part may indeed be transparent, the whole may not be

- Using Inheritance (is-a relationship) is better to say as "specialization", use it when you want add small behaviour.

- Benefit of Inheritance can be described as open–closed; because Adding a new sub-class to an existing hierarchy requires no changes to existing code. But it has cost, because there will be a condition when you need to add behavior but find there’s no easy way do so.

## Chapter 9 : Designing Cost-Effective Tests

- Cost effective Test's purpose is to finding bugs early, provide better abstraction(make extension of the abstraction easier) and supply documentation.

- If a test requires painful setup, the code expects too much context.

- If testing one object drags a bunch of others into the mix, the code has too many dependencies.

- If the test is hard to write, other objects will find the code difficult to reuse.

- Good code or Maintainable code is easier to write the testing for it

- Removing duplication from testing lowers the cost of changing tests in reaction to application changes, and putting tests in the right place guarantees they’ll be forced to change only when absolutely necessary.

- Tests should concentrate on the incoming or outgoing messages that cross an object’s boundaries.
