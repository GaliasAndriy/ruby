class Mark 
    attr_reader :subject, :value # attr

    def initialize(subject, value)
        @subject = subject
        @value = value
    end

    def to_s 
        "#{@subject}: #{@value}"
    end
end

class Student
    attr_reader :name, :marks

    def initialize(name)
        @name = name
        @marks = []
    end

    def exists?(subject_title)
        @marks.any? {|mark| mark.subject == subject_title} 
    end

    def add_mark(mark)
        unless exists?(mark.subject)
            @marks << mark 
        else
            puts "\nПредмет '#{mark.subject}' вже є у студента #{@name}"
        end
    end

    def to_s
        marks_str = @marks.empty? ? "[]" : @marks.map(&:to_s).join(", ")
        "#{@name}: [#{marks_str}]"
    end
end

student = Student.new("Andrii")
mark1 = Mark.new("C++", 80)
mark2 = Mark.new("Ruby", 91)
mark3 = Mark.new("Math", 75)
student.add_mark(mark1)
student.add_mark(mark2)
student.add_mark(mark1)
student.add_mark(mark3)

puts "\n", student