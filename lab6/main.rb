# Check if an argument is provided
if ARGV.empty?
    puts "Usage: ruby main.rb <task_arg>"
  else
    task_arg = ARGV[0]
    case task_arg
    when "1"
      require_relative "task1"
    when "2"
      require_relative "task2"
    else
      puts "Usage: ruby main.rb <task_arg>"
    end
  end