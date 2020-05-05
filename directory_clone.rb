

students = [
  {name: "Dr. Hannibal Lecter", cohort: :April, height: "5,11"},
  {name: "Darth Vader", cohort: :April, height: "5,10"},
  {name: "Nurse Ratched", cohort: :April, height: "5,8"},
  {name: "Michael Corleone", cohort: :April, height: "5,9"},
  {name: "Alex DeLarge", cohort: :April, height: "6"},
  {name: "The Wicked Witch of the West", cohort: :April, height: "5,10"},
  {name: "Terminator", cohort: :April, height: "6,4"},
  {name: "Freddy Krueger", cohort: :April, height: "5,11"},
  {name: "The Joker", cohort: :April, height: "5,9"},
  {name: "Joffrey Baratheon", cohort: :April, height: "5,7"},
  {name: "Norman Bates", cohort: :April, height: "5,10"},
]

def print_header
  puts "The students of my cohort at Makers"
  puts "-------------"
end

def print(names)
  names.each do |name|
    puts "#{name[:name]} (#{name[:cohort]} cohort). Height #{name[:height]}"
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
