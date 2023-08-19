require_relative 'classroom'
require_relative 'person'
require_relative 'teacher'
require_relative 'student'

class Main
  def initialize
    @people = []
    @books = []
    @rentals = []
    @menu_options = {
      1 => :list_books,
      2 => :list_people,
      3 => :create_person,
      4 => :create_book,
      5 => :create_rental,
      6 => :list_rentals_for_person,
      7 => :exit_library_system
    }
  end

  def run
    loop do
      display_menu
      choice = gets.chomp.to_i

      if @menu_options[choice]
        send(@menu_options[choice])
      else
        invalid_choice
      end
    end
  end

  def display_menu
    puts "\nWelcome to the Library Management System!"
    puts 'Select an option:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a person by ID'
    puts '7. Quit'
  end

  def list_books
    puts "\nList of Books:"
    @books.each_with_index do |book, index|
      puts "#{index + 1}. #{book.title} by #{book.author}"
    end
  end

  def list_people
    puts "\nList of People:"
    @people.each_with_index do |person, index|
      puts "#{index + 1}. #{person.name} (ID: #{person.id})"
    end
  end

  def create_person
    puts "\nCreate a person:"
    puts '1. Create a Student'
    puts '2. Create a Teacher'
    choice = gets.chomp.to_i

    case choice
    when 1 then create_student
    when 2 then create_teacher
    else puts 'Invalid choice.'
    end
  end

  def create_student
    puts "Enter student's name:"
    name = gets.chomp
    puts "Enter student's age:"
    age = gets.chomp.to_i
    puts 'Does the student have parent permission? (yes/no)'
    parent_permission = gets.chomp.downcase == 'yes'

    student = Student.new(name, age, parent_permission)
    @people << student
    puts "#{student.name} has been created as a student with ID: #{student.id}"
  end

  def create_teacher
    puts "Enter teacher's name:"
    name = gets.chomp
    puts "Enter teacher's age:"
    age = gets.chomp.to_i
    puts "Enter teacher's specialization:"
    specialization = gets.chomp

    teacher = Teacher.new(name, age, specialization)
    @people << teacher
    puts "#{teacher.name} has been created as a teacher with ID: #{teacher.id}"
  end

  def create_book
    puts 'Enter book title:'
    title = gets.chomp
    puts 'Enter book author:'
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    puts "#{book.title} by #{book.author} has been added to the library."
  end

  def create_rental
    puts 'Choose a book by entering its number:'
    list_books
    book_index = gets.chomp.to_i - 1
    book = @books[book_index]

    puts "Enter the person's ID (student or teacher):"
    list_people
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }

    if book && person
      puts 'Enter rental date (YYYY-MM-DD):'
      date = gets.chomp
      rental = book.add_rental(person, date)
      @rentals << rental
      puts "#{book.title} has been rented by #{person.name} on #{date}."
    else
      puts 'Invalid book or person ID.'
    end
  end

  def list_rentals_for_person
    puts "Enter the person's ID (student or teacher):"
    list_people
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }

    if person
      puts "Rentals for #{person.name}:"
      person.rentals.each do |rental|
        puts "#{rental.book.title} (Rented on #{rental.date})"
      end
    else
      puts 'Invalid person ID.'
    end
  end

  private

  def invalid_choice
    puts 'Invalid choice. Please select a valid option.'
  end

  def exit_library_system
    puts 'Goodbye!'
    exit(0)
  end
end

Main.new.run
