class Game
  
  def initialize()
    @board = Array.new(9, " ")
    @winning_moves = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],

      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],

      [0, 4, 8],
      [2, 4, 6]
    ]
    @player_x = []
    @player_o = []
  end

  def is_valid_move?(square)
    @board[square] == " "
  end

  def is_winner?(player)
    @winning_moves.each do |winning_set|
      if (winning_set - player).empty?
        return true
      end
    end
    return false
  end

  def is_a_tie?
    !@board.include?(" ")
  end

  def print_board
    @board.each_with_index do |square, i|
      if (i == 0)
        print "\n" + square
      elsif (i%3 == 0)
        print "\n-----"
        print "\n" + square
      else
        print "|" + square
      end
    end
    print "\n\n"
  end

  def number_or_nil(s)
    s = s.chomp
    if s =~ /\A-?\d+\z/
      s.to_i
    end
  end

  def get_input
    print "Choose your move: "
    square = number_or_nil gets
    while true
      if square && is_valid_move?(square)
        break
      else
        puts "That's not a valid square! Try again."
        print "Choose your move: "
        square = number_or_nil gets
      end
    end
    @board[square] = "X"
    @player_x << square
  end

  def get_computer_input
    square = rand(8)
    while true
      if square && is_valid_move?(square)
        break
      else
        square = rand(8)
      end
    end
    @board[square] = "O"
    @player_o << square
  end

  def round
    puts "Welcome to Tic-Tac-Toe! You are player X, and you go first."
    print_board
    while true
      get_input
      print_board
      if is_winner?(@player_x)
        puts "You won!"
        break
      elsif is_a_tie?()
        puts "Tie!"
        break
      end

      puts "Now for the computer to move..."
      gets.chomp

      get_computer_input
      print_board
      if is_winner?(@player_o)
        puts "You lost!"
        break
      elsif is_a_tie?()
        puts "Tie!"
        break
      end
    end
  end
end


#############
# Test Area #
#############


x = Game.new()

x.round