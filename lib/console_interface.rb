# frozen_string_literal: true

class ConsoleInterface
  FIGURES =
    Dir[File.join(__dir__, '/../data/figures/*.txt')]
    .sort
    .map { |file_name| File.read(file_name) }

  def initialize(game)
    @game = game
  end

  def print_out
    puts "Слово: #{word_to_show}".colorize(:light_blue)
    puts figure.colorize(:light_yellow)
    puts "Ошибки (#{@game.errors_made}): #{errors_to_show}".colorize(:light_red)
    puts  "У вас осталось ошибок: #{@game.errors_allowed}".colorize(:red)


    if @game.won?
      puts 'Поздравляем, вы выиграли!'.colorize(color: :black, background: :light_green)
    elsif @game.lost?
      puts "Вы проиграли, загаданное слово: #{@game.word}".colorize(color: :black, background: :light_red)
    end
  end

  def figure
    FIGURES[@game.errors_made]
  end

  def word_to_show
    @game.letters_to_guess.map { |letter| letter || '__' }.join(' ')
  end

  def errors_to_show
    @game.errors.join(', ')
  end

  def get_input
    print 'Введите следующую букву: '
    gets[0].upcase
  end
end
