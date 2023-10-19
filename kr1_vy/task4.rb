def generate_password(length)
  characters = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
  password = ''
  
  length.times do
    random_index = rand(characters.length)
    password += characters[random_index].to_s
  end

  return password
end

puts "Введіть бажану довжину паролю:"
password_length = gets.chomp.to_i

if password_length <= 0
  puts "Довжина паролю повинна бути більше 0."
else
  generated_password = generate_password(password_length)
  puts "Згенерований пароль: #{generated_password}"
end