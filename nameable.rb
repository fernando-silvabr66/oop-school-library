# frozen_string_literal: true

# Parent class for person
class Nameable
  def correct_name
    raise NotImplementedError
  end
end
