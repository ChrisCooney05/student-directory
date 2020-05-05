def input_students
  puts "Please enter the names of the students"
  puts "to finish, please hit return twice"
  name = gets.delete!("\n")
  puts "Please let me know what cohort they are on"
  cohort = gets.delete!("\n")
  if cohort.empty?
    cohort = "Not suplied"
  end

  students = []
  while !name.empty?
    students << {name: name, cohort: cohort.to_sym}
    if students.length == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    name = gets.delete!("\n")
    if name.empty?
      break
    end

    cohort = gets.delete!("\n")
    if cohort.empty?
      cohort = "Not suplied"
    end
  end
  students
end

def print_header
  puts "What cohort would you like to see?"
  @cohort = gets.delete!("\n")
  puts "The students of my cohort at Makers"
  puts "-------------"
end

#instead of printing out each student we can use a loop to itirate over the array.
def print(names)
  names.map do |name|
    puts "#{name[:name]} (cohort: #{name[:cohort]})" if name[:cohort] == @cohort.to_sym
  end
end



#using string interpolation we can refactor the code so it looks cleaner.
#we can use the .count() method to get the number of student.
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#we need to call the methods with any relevent arguments to get the results.
students = input_students
if students.length < 1
  puts "You need to add some students"
  students = input_students()
end
print_header
print(students)
print_footer(students)
