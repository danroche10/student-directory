require "csv"

@students = []

months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]

user_menu = {
  1 => :input_students,
  2 => :show_students,
  3 => :save_students,
  4 => :load_students,
  9 => :exit
}

def input_students(months)
  puts "Please enter some student details"
  puts "To finish, just hit return twice"
  # get the first name
  puts "Name:"
  name = STDIN.gets.delete("\n")
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Hobbies:"
    hobbies = STDIN.gets.chomp
    puts "Country of birth:"
    birthplace = STDIN.gets.chomp
    birthplace == "" ? birthplace = "unknown" : birthplace = birthplace
    puts "Cohort"
    cohort = STDIN.gets.chomp.downcase
    while !months.include?(cohort) do
      puts "This cohort isn't recognised. Please try again."
      cohort = STDIN.gets.chomp.downcase
    end
    # add the student hash to the array
    add_to_student_array(name, hobbies, birthplace, cohort)
    puts "Now we have #{@students.count} students"
    # STDIN.gets another name from the user
    puts "Name:"
    name = STDIN.gets.chomp
  end
  # return the array of students
  @students
end

def add_to_student_array(name, hobbies, birthplace, cohort)
  @students << {name: name, hobbies: hobbies, birthplace: birthplace, cohort: cohort.to_sym}
end

def print_header
  puts ("The students of the villian academy").center(100)
  puts ("-----------------").center(100)
end

def print_students_list
  @students.map { |student| student[:cohort] }.uniq.each do |cohort|
    puts cohort.capitalize()
    @students.each_with_index do |student, index|
      if cohort == student[:cohort]
        puts ("#{index+1}. Name: #{student[:name]}, Hobbies: #{student[:hobbies]}, Birthplace: #{student[:birthplace]}, (#{student[:cohort]} cohort)").center(100, "-----")
      end
    end
  end
end

def print_footer
  puts ("Overall, we have #{@students.count} great #{@students.count > 1 ? "students" : "student"}").center(100, "-----")
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" #9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection, months, user_menu)
  # enable to user to navigate to the correct place
  selected_option = user_menu[selection.to_i]
  if selection.to_i == 1
    send(selected_option, months)
  elsif user_menu.keys[1..-1].include?(selection.to_i)
    send(selected_option)
    puts "#{selected_option} completed!"
  else
    puts "I don't know what you mean, try again"
  end
end

def interactive_menu(months, user_menu)
  loop do
    print_menu
    process(STDIN.gets.chomp, months, user_menu)
  end
end

def save_students
  # Ask user which file they want to save data to
  puts "Which file do you want to save data to?"
  file_name = gets.chomp

  # iterate over the array of students and add to CSV
  CSV.open(file_name, "wb") do |row|
    @students.each do |student|
      row << [student[:name], student[:hobbies], student[:birthplace], student[:cohort]]
    end
  end
end

def load_students(filename = "students.csv")
  # Ask user which file they want to load data from
  puts "Which file do you want to load data from?"
  file_name = gets.chomp
  # add students from CSV file into students array
  CSV.foreach(filename) do |row|
    name, hobbies, birthplace, cohort = row
    add_to_student_array(name, hobbies, birthplace, cohort)
  end
end

def try_load_students(filename = "students.csv")
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

interactive_menu(months, user_menu)
