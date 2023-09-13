names = ['Папір', 'Камінь', 'Ножиці']

player_choice = names.index(ARGV[0])
bot_choice = names.index(ARGV[1])

puts "Ви обрали: " + names[player_choice]
puts "Ботік обрав: " + names[bot_choice]

if player_choice == bot_choice
    puts "Нічия"
elsif (player_choice == 0 && bot_choice == 1) ||
        (player_choice == 1 && bot_choice == 2)  ||
        (player_choice == 2 && bot_choice == 0)
    puts "Перемога)"
else
    puts "Поразка("
end