require './base_decorator'

# Trimmer decorator
class TrimmerDecorator < Base
  def correct_name
    @nameable.correct_name[0...10] unless @nameable.correct_name.length < 10
  end
end
