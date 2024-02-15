# Function to calculate the cost of one book instance
def format_number(number)
    formatted_number = number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\1,').reverse
    puts formatted_number
end

def calculate_book_cost(pages, copies)
    author_royalty_per_page = 24
    design_cost_percentage = 0.3 # 30%
    typography_setup_cost_per_page = 1.2
    paper_cost_per_page = 0.16
    ink_cost_per_page = 0.04
    depreciation_cost_per_page = 0.08
    cover_cost = 3 # per 1 book
    profit_margin_percentage = 0.23
    tax_rate = 0.3

    # Вартості авторського гонорару, оформлення та типографського набору за книгу
    author_royalty = author_royalty_per_page * pages
    design_cost = author_royalty * design_cost_percentage
    typography_setup_cost = typography_setup_cost_per_page * pages
    editorial_expenses = author_royalty + design_cost + typography_setup_cost

    # Вартості паперу, фарби та амортизації за 1 книгу
    paper_cost = paper_cost_per_page * pages + cover_cost
    ink_cost = ink_cost_per_page * pages
    depreciation_cost = depreciation_cost_per_page * pages
    typography_expenses_per_book = paper_cost + ink_cost + depreciation_cost
    
    # Собівартість
    cost = editorial_expenses + typography_expenses_per_book * copies
    cost_of_book = cost / copies

    # Прибуток видавництва
    revenue = cost * profit_margin_percentage + cost
    clean_revenue = revenue - cost

    # Податки
    taxes_from_revenue = revenue * tax_rate + revenue
    taxes_per_instance = taxes_from_revenue / copies

    puts "Авторський гонорар: #{author_royalty.round(4)}₴"
    puts "Вартість оформлення: #{design_cost.round(4)}₴"
    puts "Вартість типографського набору: #{typography_setup_cost.round(4)}₴"
    print ("-----------------------------------------")
    puts "\nРедакційні витрати: #{editorial_expenses.round(4)}₴"

    puts "\nВартість паперу з обкл на книгу: #{paper_cost.round(4)}₴"
    puts "Вартість фарби на книгу: #{ink_cost.round(4)}₴"
    puts "Вартість амортизації на книгу: #{depreciation_cost.round(4)}₴"
    print ("-----------------------------------------")
    puts "\nТипографські витрати на 1 книгу: #{typography_expenses_per_book.round(4)}₴" 

    puts "\nСобівартість: #{cost.round(4)}₴" 
    puts "\Вартісь 1 книги: #{cost_of_book.round(4)}₴" 

    puts "\nПрибуток видавництва : #{revenue.round(4)}₴"

    puts "\nПодаток: #{taxes_from_revenue.round(4)}₴"

    puts "\nПодаток на екземпляр: #{taxes_per_instance.round(2)}₴"
end
  
# Check if the correct number of command-line arguments is provided
if ARGV.length != 2
    puts "Usage: ruby <fileName>.rb <pages> <copies>"
    exit
  end
  
  # Parse command-line arguments
  pages, copies = ARGV.map(&:to_i)
  
  calculate_book_cost(pages, copies)