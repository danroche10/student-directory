def input_students

  months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]

  puts "Please enter some student details"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  puts "Name:"
  name = gets.chomp
  if name.length > 0
    puts "Hobbies:"
    hobbies = gets.chomp
    puts "Country of birth:"
    birthplace = gets.chomp
    birthplace == "" ? birthplace = "unknown" : birthplace = birthplace
    puts "Cohort"
    cohort = gets.chomp
    while !months.include?(cohort.downcase) do
      puts "This cohort isn't recognised. Please try again."
      cohort = gets.chomp
    end
  end
 
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, hobbies: hobbies, birthplace: birthplace, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"
    # gets another name from the user
    puts "Name:"
    name = gets.chomp
    if name.length > 0
      puts "Hobbies:"
      hobbies = gets.chomp
      puts "Country of birth:"
      birthplace = gets.chomp
      birthplace == "" ? birthplace = "unknown" : birthplace = birthplace
      puts "Cohort"
    while !months.include?(cohort.downcase) do
      puts "This cohort isn't recognised. Please try again."
      cohort = gets.chomp
    end
    end
  end
  # return the array of students
  students
end

def print_header
  puts ("The students of the villian academy").center(100)
  puts ("-----------------").center(100)
end

def print(students)
  students.each_with_index do |student, index|
      puts ("#{index+1}. #{student[:name]} Hobbies: #{student[:hobbies]}, Birthplace: #{student[:birthplace]}, (#{student[:cohort]} cohort)").center(100, "-----")
  end
end

def print_footer(students)
    puts ("Overall, we have #{students.count} great students").center(100, "-----")
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)