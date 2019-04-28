# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [  # 3 vertical, 3 horizontal, 2 diagnol
  [0, 1 , 2],
  [3, 4 , 5],
  [6, 7 , 8],
  [0, 3 , 6],
  [1, 4 , 7],
  [2, 5 , 8],
  [2, 4 , 6],
  [0, 4 , 8],
]

def display_board(board)  # dispaly board based on array of user positions
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board, index)
  if position_taken?(board, index) && index.between?(0, 8)
    return true
  else
    return false
  end
end


def input_to_index(user_input)
  user_input.to_i - 1
end


def move(board, index, current_player = "X")
  board[index] = current_player
end


def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end


def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end


def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  counter = 0
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
    counter += 1
  else
    turn(board)
  end
  return turn_count(board, counter)
end

def turn_count(board, counter)  # look at how many
  return counter
end

def won?(board)  # return false if no winning combo; return winning combination index if there is a win
  WIN_COMBINATIONS.each do |win_combinations| # for each winning_combination
    win_combinations
     index_0 = board[win_combinations[0]]  # index 0
     index_1 = board[win_combinations[1]]  # index 0
     index_2 = board[win_combinations[2]]  # index 0
     # look at 0, 1, 2 index and if all are X, then there's a win, or if all are O there's a win
     if (index_0 == 'X' && index_1 == 'X' && index_2 == 'X') || (index_0 == 'O' && index_1 == 'O' && index_2 == 'O')
       return win_combinations
     end
  end
  return false
end

def full?(board) # returns false if not full; returns true if full
  !board.include?(" ")
end

def draw?(board)
  full = full?(board)
  won = won?(board)
  if full && !won  # not been won but is full => true
    return true
  else # not been won but not full => false
    return false
  # board is won => false
  end
end

def over?(board)  # returns TRUE if board is won or a draw or full
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)  # returns the winner of the game if there is a winner (trigger via won?)
  winning_array = won?(board)
  if winning_array != false
    return board[winning_array[0]]
  else
    return nil
  end
end

#board = ["O", "O", "O", " ", " ", " ", " ", " ", " "]
