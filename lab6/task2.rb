require "csv"
file_data = './data.csv'

max_score = 100
upper_bound = 10
lower_bound = 15

top_students = []
middle_students = []
bottom_students = []

students = []

CSV.foreach(file_data) do |row|
    students << [row[0], row[1].to_i]
end

# DESC order + sort for alphabetical order
students.sort_by!{|name, score| [-score, name]}

students.each do |name, score| 
    if score >= max_score - upper_bound
        top_students << name
    elsif score >= max_score - upper_bound - lower_bound
        middle_students << name
    else 
        bottom_students << name
    end 
end

result = {
    top: top_students,
    middle: middle_students,
    bottom: bottom_students
}

puts("\nResult Task 2: \n" + result.inspect)