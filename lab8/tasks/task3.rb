class Pizza
    @@count = 0
    @@failInstance = 0

    def initialize(diameter, ingradients)
        @number = @@count
        @@count += 1

        @diameter = 0
        @ingradients = []

        if diameter == 25 || diameter == 50
            @diameter = diameter
        else
            @@failInstance += 1
            return
        end

        @ingradients = ingradients
    end

    def self.failInstance
        @@failInstance
    end
end

pizza1 = Pizza.new(10, ['mushroom', 'cheese'])
pizza2 = Pizza.new(25, ['mushroom', 'cheese', 'cherry'])
pizza3 = Pizza.new(50, ['mushroom'])
pizza4 = Pizza.new(100, ['mushroom', 'cheese', 'cherry'])

puts Pizza.failInstance
puts ("\n")