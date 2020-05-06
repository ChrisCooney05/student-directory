require 'csv'

@students = []

def input_students
  puts "Please enter the names of the students"
  puts "to finish, please hit return twice"
  @name = gets.chomp
  add_students
end

def add_students
  while !@name.empty?
    @students << {name: @name, cohort: :april}
    puts "Now we have #{@students.count} students"
    @name = gets.chomp
  end
end

def print_header
  puts "The students of my cohort at Makers"
  puts "-------------"
end

#instead of printing out each student we can use a loop to itirate over the array.
def print_students
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
  puts "4. Load list from students.csv"
  puts "5. Show current file name"
  puts "9. Exit"
end

def show_students
  print_header
  print_students
  print_footer
end

def process(selection)
  case selection
    when "1"
      puts "Moving to input students"
      input_students
    when "2"
      puts "Loading student list"
      show_students
    when "3"
      puts "Saving new students"
      save_students
    when "4"
      puts "Loading student list"
      load_students
    when "5"
      print "Current file name is: "
      file_name
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
    process(STDIN.gets.chomp)
  end
end

def save_students
  CSV.open(@filename, "w") do |file| # open the file for writing. csv - comma seperated format
    @students.each do |student|
      file << [student[:name], student[:cohort]]
    end
  end
end

# def save_students
#   File.open("students.csv", "w") do |file| # open the file for writing. csv - comma seperated format
#     @students.each do |student|
#       student_data = [student[:name], student[:cohort]]
#       csv_line = student_data.join(",")
#       file.puts csv_line
#     end
#   end
# end

def load_students(filename="students.csv")
  @filename = filename
  CSV.foreach(@filename) do |line| #no need to open and close file
    name, cohort = line[0], line[1]
    #name gets first part of the split array, cohort second (parallel assignment)
    @students << {name: name, cohort: cohort.to_sym}
  end
  puts "Loaded #{@students.count} students from #{filename}"
end

# def load_students(filename="students.csv")
#   File.readlines(filename).each do |line| #no need to open and close file
#     name, cohort = line.chomp.split(",")
#     #name gets first part of the split array, cohort second (parallel assignment)
#     @students << {name: name, cohort: cohort.to_sym}
#   end
#   puts "Loaded #{@students.count} students from #{filename}"
# end

def try_load_students
  filename = ARGV.first #first argument from the command line
  if filename.nil?
    load_students
  elsif File.exists?(filename) #if it exists
    load_students(filename)
  else
    puts "Sorry, #{filename} does not exist"
    exit
  end
end

def file_name
  puts $0
end

try_load_students
interactive_menu
