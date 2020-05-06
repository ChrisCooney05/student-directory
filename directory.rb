def input_students
  puts "Please enter the names of the students"
  puts "to finish, please hit return twice"
  name = gets.chomp
  students = []
  while !name.empty?
    students << {name: name, cohort: :april}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

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

def interactive_menu
  students =[]
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      puts "Have a good day"
      exit
    else
      puts "I dont know what you mean"
    end
  end
end

interactive_menu
