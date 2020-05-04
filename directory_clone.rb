#We can use a hash to add extra infomation to each student, making it easier to call.

students = [
  {name: "Dr. Hannibal Lecter", cohort: :april},
  {name: "Darth Vader", cohort: :april},
  {name: "Nurse Ratched", cohort: :april},
  {name: "Michael Corleone", cohort: :april},
  {name: "Alex DeLarge", cohort: :april},
  {name: "The Wicked Witch of the West", cohort: :april},
  {name: "Terminator", cohort: :april},
  {name: "Freddy Krueger", cohort: :april},
  {name: "The Joker", cohort: :april},
  {name: "Joffrey Baratheon", cohort: :april},
  {name: "Norman Bates", cohort: :april},
]

def print_header
  puts "The students of my cohort at Makers"
  puts "-------------"
end

#instead of printing out each student we can use a loop to itirate over the array.
def print(names)
  names.each do |name|
    puts "#{name[:name]} (#{name[:cohort]} cohort)"
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
