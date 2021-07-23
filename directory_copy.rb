@students = []

months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]

def input_students(months)

  puts "Please enter some student details"
  puts "To finish, just hit return twice"
  # create an empty array
  # get the first name
  puts "Name:"
  name = gets.delete("\n")
  
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Hobbies:"
    hobbies = gets.chomp
    puts "Country of birth:"
    birthplace = gets.chomp
    birthplace == "" ? birthplace = "unknown" : birthplace = birthplace
    puts "Cohort"
    cohort = gets.chomp.downcase
    while !months.include?(cohort) do
      puts "This cohort isn't recognised. Please try again."
      cohort = gets.chomp.downcase
    end
    # add the student hash to the array
    @students << {name: name, hobbies: hobbies, birthplace: birthplace, cohort: cohort.to_sym}
    puts "Now we have #{@students.count} students"
    # gets another name from the user
    puts "Name:"
    name = gets.chomp
  end
  # return the array of students
  @students
end

def print_header
  puts ("The students of the villian academy").center(100)
  puts ("-----------------").center(100)
end

def print_students_list
    cohorts = @students.map { |student| student[:cohort] }.uniq
    cohorts.each do |cohort|
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

def process(selection, months)
  case selection
    when "1"
      input_students(months)
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
    end
end

def interactive_menu(months)
  loop do
    print_menu
    process(gets.chomp, months)
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close

end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {  name: name, cohort: cohort.to_sym }
  end
  file.close
end

interactive_menu(months)
