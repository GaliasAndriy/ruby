n = 7
non_alco = [5, 7, 1, 2, 5]
alco = [3, 5, 2, 1, 7, 2, 3, 2] 

# Загальний список та загальна кількість замовлень
total_orders = non_alco + alco
total_orders_count = total_orders.length

puts "Лабораторна робота №4. Використання циклів для умови з lab3"
puts "1. Загальна кількість замовлень = #{total_orders_count}"

visited_clients = []
total_orders.each do |order|
    visited_clients << order unless visited_clients.include?(order)
  end

puts "2. Список клієнтів, що сьогодні відвідали кафе: #{visited_clients}"

non_alco_count = 0
non_alco.each do
  non_alco_count += 1
end
puts "3. Кількість безалкогольних замовлень = #{non_alco_count}"

non_alco_clients = []
non_alco.each do |order|
  non_alco_clients << order unless non_alco_clients.include?(order)
end
puts "4. Список клієнтів, що робили «безалкогольні» замовлення: #{non_alco_clients}"

alco_count = alco.length
puts "5. Кількість алкогольних замовлень = #{alco_count}"

alco_clients = []
alco.each do |order|
  alco_clients << order unless alco_clients.include?(order)
end
puts "6. Кількість та список клієнтів, що робили «алкогольні» замовлення: #{alco_clients}"

both_clients = non_alco_clients & alco_clients
puts "7. Кількість та список клієнтів, що робили обидва типи замовлень: #{both_clients}"

all_clients = (1..n).to_a
non_visiting_clients = all_clients - visited_clients
puts "8. Кількість та список постійних клієнтів, що сьогодні не відвідували кафе: #{non_visiting_clients}"