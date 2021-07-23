months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]

def input_students(months)

  puts "Please enter some student details"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
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
    students << {name: name, hobbies: hobbies, birthplace: birthplace, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"
    # gets another name from the user
    puts "Name:"
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts ("The students of the villian academy").center(100)
  puts ("-----------------").center(100)
end

def print(students)
    cohorts = students.map { |student| student[:cohort] }.uniq
    cohorts.each do |cohort|
      puts cohort.capitalize()
      students.each_with_index do |student, index|
        if cohort == student[:cohort]
          puts ("#{index+1}. Name: #{student[:name]}, Hobbies: #{student[:hobbies]}, Birthplace: #{student[:birthplace]}, (#{student[:cohort]} cohort)").center(100, "-----")
        end
      end
    end
end

def print_footer(students)
    puts ("Overall, we have #{students.count} great #{students.count > 1 ? "students" : "student"}").center(100, "-----")
end

# nothing happens until we call the methods
students = input_students(months)
print_header
if students.size > 0 
  print(students)
  print_footer(students)
else
  puts ("We currently do not have any students").center(100)
end