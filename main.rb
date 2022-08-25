require './app'

class Main
  def initialize
    @app = App.new
    @answer = 0
  end

  def run
    while @answer != 7
      puts("
        Please choose an option by entering a number:
        1 - List all books
        2 - List all people
        3 - Create a person
        4 - Create a book
        5 - Create a rental
        6 - List all rentals for a given person id
        7 - Exit
      ")
      @answer = gets.chomp.to_i
      cases
    end
  end

  def cases
    case @answer
    when 1
      list_books
    when 2
      list_people
    when 3
      create_people
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals_person
    end
  end

  def list_books
    @app.all_books.each do |book|
      puts("Title: #{book.title} Author: #{book.author}")
    end
  end

  def list_people
    @app.all_people.each do |person|
      puts("[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}")
    end
  end

  def create_people
    print('Do you want to create a student (1) or a teacher (2)? [Input the number]:')
    type = gets.chomp.to_i
    print('Age:')
    age = gets.chomp.to_i
    print('Name:')
    name = gets.chomp
    case type
    when 1
      print('Has parent permision? [Y/N]:')
      p = gets.chomp
      @app.create_person(age, name, parent_permision: %w[Y y].include?(p))
    when 2
      print('Specialization:')
      specialization = gets.chomp
      @app.create_person(age, name, specialization: specialization)
    end
    puts("Person created succesfully\n")
  end

  def create_book
    print('Title: ')
    title = gets.chomp
    print('Author: ')
    author = gets.chomp
    @app.create_a_book(title, author)
    puts('Book created succesfully')
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @app.all_books.each_with_index do |book, index|
      puts("#{index}) Title: #{book.title} Author: #{book.author}")
    end
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    @app.all_people.each_with_index do |person, index|
      puts("#{index})[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}")
    end
    person_index = gets.chomp.to_i
    print('Date: ')
    date = gets.chomp
    @app.create_a_rental(date, @app.books[book_index], @app.people[person_index])
    puts 'Rental created Succesfully'
  end

  def list_rentals_person
    print 'ID of person:'
    id = gets.chomp.to_i
    puts 'Rentals:'
    @app.all_rentals(id).each do |rental|
      puts("Date: #{rental.date}, Title: #{rental.book.title} by #{rental.person.name}")
    end
  end
end

m = Main.new
m.run
