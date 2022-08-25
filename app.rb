require './book'
require './teacher'
require './student'
require './rental'

class App
  attr_reader :rentals, :books, :people

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # List books.

  def all_books
    @books
  end

  # List people.

  def all_people
    @people
  end

  # Create a person (teacher or student).

  def create_person(age, name, parent_permision: true, specialization: false)
    person = Teacher.new(age, specialization, name) if specialization
    person = Student.new(age, name, parent_permision, 0) unless specialization
    @people.push(person)
  end

  # Create a book.

  def create_a_book(title, author)
    new_book = Book.new(title, author)
    @books.push(new_book)
  end

  # Create a rental.

  def create_a_rental(date, book, person)
    rental = Rental.new(date, book, person)
    @rentals.push(rental)
  end

  # List rentals for a given person id.
  def all_rentals(id)
    person = ''
    @people.each do |p|
      person = p if p.id == id
    end
    person.rentals
  end
end
