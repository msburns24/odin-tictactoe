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
  end

  def is_a_tie?
    !@board.include?(nil)
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

  def round
    puts "Welcome to Tic-Tac-Toe! You are player X, and you go first."
    
    while true
    end
  end
end


#############
# Test Area #
#############

x = Game.new()

(0..8).each do |i| 
  p x.is_valid_move?(i)
end