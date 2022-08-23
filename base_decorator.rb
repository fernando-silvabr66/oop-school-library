require './nameable'

# Parent class for Trimmer and Capitalize decorators
class Base < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
