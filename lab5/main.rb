def count_characters(string)
    size = string.length
    uppercase_count = string.scan(/[A-Z]/).size
    lowercase_count = string.scan(/[a-z]/).size
    digit_count = string.scan(/\d/).size
  
    puts "Розмір рядка без пробілів: #{size - string.count(' ')}"
    puts "Розмір рядка з пробілами: #{size}"
    puts "Кількість заголовних букв: #{uppercase_count}"
    puts "Кількість прописних букв: #{lowercase_count}"
    puts "Кількість цифр: #{digit_count}"
  end
  
  def suspicious_abbr(string)
    words = string.split
    suspicious_words = words.select { |word| word.match?(/[A-Za-z]+\d+[A-Za-z]*/) }
    puts "Слова, підозрілі на абревіатуру: #{suspicious_words}"
  end
  
  def sort_by_length_descending(string)
    words = string.split
    sorted_words = words.sort_by { |word| -word.length }
    sorted_text = sorted_words.join(' ')
    puts "Текст зі словами у порядку спадання довжини: #{sorted_text}"
  end
  
  def capitalize_words(string)
    words = string.split
    capitalized_words = words.map { |word| word.capitalize }
    puts "Масив слів з кожним словом у заголовному форматі: #{capitalized_words}"
  end
  
  def main()
    print "Введіть текстовий рядок: "
    input_string = gets.chomp
  
    count_characters(input_string)
    sorted_words = input_string.split.sort_by(&:length)
    transformed_words = sorted_words.map(&:capitalize)
    puts "Масив слів у порядку зростання довжини: #{transformed_words}"
  
    suspicious_abbr(input_string)
    sort_by_length_descending(input_string)
    capitalize_words(input_string)
  end
  
  main()
  