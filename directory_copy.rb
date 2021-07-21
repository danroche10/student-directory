def input_students
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
  end
 
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, hobbies: hobbies, birthplace: birthplace, cohort: :november}
    puts "Now we have #{students.count} students"
    # gets another name from the user
    puts "Name:"
    name = gets.chomp
    if name.length > 0
      puts "Hobbies:"
      hobbies = gets.chomp
      puts "Country of birth:"
      birth_country = gets.chomp
    end
  end
  # return the array of students
  students
end

def print_header
  puts "The students of the villian academy"
  puts "-----------------"
end

def print(students)
  students.each_with_index do |student, index|
      puts "#{index+1}. #{student[:name]} Hobbies: #{student[:hobbies]}, Birthplace: #{student[:birthplace]}, (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)