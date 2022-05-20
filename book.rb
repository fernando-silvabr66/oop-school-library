require './rental'

# class book
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person)
    Rental.new(Time.now, self, person)
  end
end
