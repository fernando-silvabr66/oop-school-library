require './person'
require './capitalize_decorator'
require './trimmer_decorator'

# test class for decoration, trimmer and capitalization
person = Person.new(22, 'maximilianus')
p person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalizedPerson)
p capitalized_trimmed_person.correct_name
