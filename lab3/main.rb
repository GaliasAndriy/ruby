n = 7
non_alco = [5, 7, 1, 2]
alco = [3, 5, 2, 1, 7] 

# Загальний список та загальна кількість замовлень
total_orders = non_alco + alco
total_orders_count = total_orders.length

puts "1. Загальна кількість замовлень = #{total_orders_count}"
puts "2. Список клієнтів, що сьогодні відвідали кафе: #{total_orders.uniq}"

non_alco_count = non_alco.length
puts "3. Кількість безалкогольних замовлень = #{non_alco_count}"

non_alco_clients = non_alco.uniq
puts "4. Cписок клієнтів, що робили «безалкогольні» замовлення: #{non_alco_clients}"

alco_count = alco.length
puts "5. Кількість алкогольних замовлень = #{alco_count}"

alco_clients = alco.uniq
puts "6. Кількість та список клієнтів, що робили «алкогольні» замовлення: #{alco_clients}"

both_clients = non_alco_clients & alco_clients
puts "7. Кількість та список клієнтів, що робили обидва типи замовлень: #{both_clients}"

all_clients = (1..n).to_a
non_visiting_clients = all_clients - total_orders.uniq
puts "8. Кількість та список постійних клієнтів, що сьогодні не відвідували кафе: #{non_visiting_clients}"