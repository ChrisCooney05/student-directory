

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

def print_header
  puts "The students of my cohort at Makers"
  puts "-------------"
end

#instead of printing out each student we can use a loop to itirate over the array.
#Using the each_with_index method we can also include a student number.
def print(names)
  names.each_with_index do |name, index|
    puts "#{index+1}. #{name}"
  end
end

#using string interpolation we can refactor the code so it looks cleaner.
#we can use the .count() method to get the number of student.
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#we need to call the methods with any relevent arguments to get the results.

print_header
print(students)
print_footer(students)
