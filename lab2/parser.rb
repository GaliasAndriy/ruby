def parseStringToLowerCase(input_string)
    input_string.downcase.strip
end

def parseInteger(input_int_num)
    begin
      return Integer(input_int_num)
    rescue ArgumentError
      puts "Invalid value for integer. Please provide a valid Integer number."
      exit(1)
    end
  end
  