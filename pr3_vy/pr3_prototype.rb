class Prototype
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def clone
    raise NotImplementedError, "#{self.class} не реалізував метод clone"
  end
end

class ConcretePrototype1 < Prototype
  @speed
  def clone
    new_object = self.dup
    return new_object
  end
end

class ConcretePrototype2 < Prototype

  def initialize(name, speed)
    super(name)
    @speed = speed
  end
  def clone
    new_object = self.dup
    return new_object
  end
end

prototype1 = ConcretePrototype1.new("Прототип 1")
prototype2 = ConcretePrototype2.new("Прототип 2", 100)

clone1 = prototype1.clone
clone2 = prototype2.clone

puts "Оригінальний об'єкт 1: #{prototype1.inspect}"
puts "Клонований об'єкт 1: #{clone1.inspect}"

puts "Оригінальний об'єкт 2: #{prototype2.inspect}"
puts "Клонований об'єкт 2: #{clone2.inspect}"