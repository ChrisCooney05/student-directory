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

def print_students
  @students.each do |name|
    puts "#{name[:name]} (#{name[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

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
  CSV.open(@filename, "w") do |file|
    @students.each do |student|
      file << [student[:name], student[:cohort]]
    end
  end
end


def load_students(filename="students.csv")
  @filename = filename
  CSV.foreach(@filename) do |line|
    name, cohort = line[0], line[1]
    @students << {name: name, cohort: cohort.to_sym}
  end
  puts "Loaded #{@students.count} students from #{filename}"
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students
  elsif File.exists?(filename)
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
