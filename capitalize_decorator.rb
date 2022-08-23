require './base_decorator'

# Capitalize decorator
class CapitalizeDecorator < Base
  def correct_name
    @nameable.correct_name.capitalize
  end
end
