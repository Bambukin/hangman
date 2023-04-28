# frozen_string_literal: true

require_relative 'lib/console_interface'
require_relative 'lib/game'
require 'colorize'

# Вывести преветствие/правила
puts 'Всем привет!'.colorize(color: :light_white, background: :light_green)

# Прочитать случайное слово из файла
word = File.readlines("#{__dir__}/data/words.txt", chomp: true).sample

game = Game.new(word)
console_interface = ConsoleInterface.new(game)

# Пока не закончилась игра
until game.over?
  #   Вывести очередное состояние игры
  console_interface.print_out
  #   Спросить букву
  letter = console_interface.get_input
  #   Обновить стостояние игры
  game.play!(letter)
end

# Вывести результат
console_interface.print_out
