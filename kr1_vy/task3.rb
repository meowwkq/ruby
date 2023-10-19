def sort_numbers(numbers, order)
  sorted_numbers = numbers.sort do |a, b|
    if order == 'asc'
      a <=> b
    elsif order == 'desc'
      b <=> a
    else
      a <=> b
    end
  end

  return sorted_numbers
end

puts "Введіть список чисел через пробіл:"
input = gets.chomp
numbers = input.split.map(&:to_i)

puts "Сортувати у порядку зростання ('asc') або спадання ('desc')?"
order = gets.chomp.downcase

sorted_numbers = sort_numbers(numbers, order)

puts "Результат сортування: #{sorted_numbers.join(', ')}"