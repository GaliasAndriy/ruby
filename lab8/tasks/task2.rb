# Require task1.rb to access the Student class
require_relative 'task1'

class RetakeStudent < Student
    def add_mark(mark)
        existing_mark = @marks.find_index {|m| m.subject == mark.subject}

        if existing_mark 
            @marks[existing_mark] = mark
        else
            @marks << mark
        end
    end
end

mark1 = Mark.new("C++", 75)
mark2 = Mark.new("Ruby", 91)
mark3 = Mark.new("C++", 95)

retake = RetakeStudent.new("Peter")
retake.add_mark(mark1)
retake.add_mark(mark2)
retake.add_mark(mark3)
puts retake