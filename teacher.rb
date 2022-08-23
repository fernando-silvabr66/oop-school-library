require './person'

# Teacher class that extends from person
class Teacher < Person
  def initialize(age, specialization, name = 'Unknown', parent_permision: true)
    super(age, name, parent_permision: parent_permision)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
