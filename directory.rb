# let's put all the students into an array
students =
[ "The students of Villains Academy",
 "Dr. Hannibal Lecter",
 "Darth Vader",
 "Nurse Ratched",
 "Michael Corleone",
 "Alex DeLarge",
 "The Wicked Witch of the West",
 "Terminator",
 "Freddy Krueger",
 "The Joker",
 "Joffrey Baratheon",
 "Norman Bates"
]
puts "The students of the villian academy"
puts "-----------------"
students.each do |student|
  puts student
end

# finally, we print the total
  "Overall, we have #{students.count} great students"