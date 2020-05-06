@students = []

def input_students
  puts "Please enter the names of the students"
  puts "to finish, please hit return twice"
  name = gets.chomp
  while !name.empty?
    @students << {name: name, cohort: :april}
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end
end

def print_header
  puts "The students of my cohort at Makers"
  puts "-------------"
end

#instead of printing out each student we can use a loop to itirate over the array.
def print_students_list
  @students.each do |name|
    puts "#{name[:name]} (#{name[:cohort]} cohort)"
  end
end

#using string interpolation we can refactor the code so it looks cleaner.
#we can use the .count() method to get the number of student.
def print_footer
  puts "Overall, we have #{@students.count} great students"
end

#we need to call the methods with any relevent arguments to get the results.

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      puts "Have a good day"
      exit
    else
      puts "I dont know what you mean, please try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def save_students
  file = File.open("students.csv", "w") # open the file for writing. csv - comma seperated format
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

interactive_menu
