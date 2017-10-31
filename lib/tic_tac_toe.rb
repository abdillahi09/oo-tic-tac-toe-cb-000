class TicTacToe
  # Initializes the board and creates 9 array board.
  def initialize (board = nil)
    @board = Array.new(9, " ")
  end
# Defines WIN_COMBINATIONS of the game
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
# Displays the board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
     @index = input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index) == true
    move(index,current_player)
    display_board
  else
      until valid_move?(index) == true
        puts "Please enter 1-9:"
        user_input = gets.strip
        index = input_to_index(user_input)
  end
end
end

def turn_count
counter = 0
@board.each do | count |
  if count == "X" || count == "O"
    counter += 1
end
end
counter
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.each do | win_combination |
    if @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[0]] == @board[win_combination[2]] && @board[win_combination[0]] != " "
      return win_combination
end
end
false
end

def full?
  filled = @board.all? do |position|
    position != " "
end
end

def draw?
  if full? == true && won? == false
    return true
  elsif won? == true
    return false
  elsif full? == false && won? == false
    return false
  end
end

def over?
  if won? == true || full? == true
    return true
  end
end

def winner
  if won? == false
    return nil
  else
    win_combination = won?
    return @board[win_combination[0]]
    puts "Congratulations #{@board[win_combination[0]]}!"
  end
end

def play
    over = over?
    until  over == true

      if won?!= false
       break
      end

      if draw? == true
        #puts "Cat's Game!"
       break
      end
      turn
      over = over?
    end

    if won?!= false
      winner
      puts "Congratulations #{winner}!"
    end

    if draw? == true
      puts "Cat's Game!"
    end
  end
end
