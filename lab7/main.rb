# task 1
def sum 
    yield(4) + yield(0) + yield(-12)
end

result = sum do |i|
    if i < 0
        i ** 2
    else
        i
    end
end

puts("Result Task 1: " + result.to_s)

# task 2
def check_password(username, password)
    Proc.new do |username_input, password_input|
        username_input == username && password_input == password
    end
end

admin = check_password("u1", "p1") 

puts("\nResult Task 2: ")
puts admin.call("u1", "p1") 
puts admin.call("u") 