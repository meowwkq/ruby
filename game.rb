names = ['Камінь', 'Ножиці', 'Папір']

game_over = false

while !game_over
    puts 'Ваш хід: 0 - Камінь, 1 - Ножиці, 2 - Папір'

    player_choice = gets.to_i
    bot_choice = rand(3)

    puts 'Ваш вибір: ' + names[player_choice]
    puts 'Вибір бота: ' + names[bot_choice]

    if player_choice == bot_choice
        puts 'Нічия'
    elsif (player_choice == 0 && bot_choice == 1) ||
          (player_choice == 1 && bot_choice == 2) ||  
          (player_choice == 2 && bot_choice == 0)
        puts 'Перемога'
        game_over = true
    else
        puts 'Поразка'
        game_over = true
    end
end