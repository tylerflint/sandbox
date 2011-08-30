require 'liquid'

class Person
  
  attr_accessor :firstname, :lastname, :age

  def initialize(firstname, lastname, age)
    self.firstname = firstname
    self.lastname = lastname
    self.age = age
  end

  # def to_liquid
  #   instance_variables.inject({}) { |methods,method| methods.tap { |m| m[method.to_s[1..-1]] = instance_variable_get(method) } }
  #   # self
  # end
end

people = [
  Person.new("tyler", "flint", 26),
  Person.new("john", "doe", 32),
  Person.new("mickey", "mouse", 89)
]

template = %{
  {% for person in people%}
    {{ person.firstname }}, {{ person.lastname }}, {{ person.age }}
  {% endfor %}
}

puts Liquid::Template.parse(template).render('people' => people)
