#We can use and array to store the names of each student

students = [
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
  "Norman Bates",
]


puts "The students of Villains Academy"
puts "-------------"
#instead of printing out each student we can use a loop to itirate over the array.
students.each do |name|
  puts name
end

puts "Overall, we have #{students.count} great students"
#using string interpolation we can refactor the code so it looks cleaner.
#we can use the .count() method to get the number of student.
