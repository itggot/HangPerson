class HangPerson

  def initialize(word:)
    @word = word.split('')
    @guesses = []
    @senap = Array.new(@word.length) do "_" end
    @allowed_characters = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z å ä ö)
    turn
    turn
  end

  def turn
    print_guessed_letters
    guess = ask_for_guess
    reveal_guessed_letters(guess)
  end

  def reveal_guessed_letters(guess)
    @word.each_with_index do |character, index|
      if guess == character
        @senap[index] = character
      end
    end
  end

  def print_guessed_letters
    p @guesses
    p @senap
  end

  def ask_for_guess
    puts "Make a guess! "
    guess = gets.chomp.downcase
    if guess.length == 1
      if !@allowed_characters.include? guess
        puts "That is not an allowed character"
        ask_for_guess
      elsif @guesses.include? guess
        puts "You already used that letter"
        ask_for_guess
      else
        @guesses << guess
        return guess
      end
    else
      if @word == guess
        puts "WHEEEEEEEEEEEE!1"
      else
        puts "WRONG!!!!!!!!"
      end
    end

  end

end

game = HangPerson.new(word: 'grabben')
p game