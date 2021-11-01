# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom Row
  [0,4,8],  # \
  [2,4,6],  # /
  [0,3,6],  # | left
  [1,4,7],  # | center
  [2,5,8],  # | right
]

def won?(board)
  WIN_COMBINATIONS.detect do |combos| #returns falsey empty board and draw
    board[combos[0]] == board[combos[1]] && 
    board[combos[1]] == board[combos[2]] && 
    position_taken?(board, combos[0])     #returns an array for matching indexes of winning combos
  end
end

def full?(board)
  board.all?{|token| token  == "X" || token == "O"} #returns true for full board by confirming all spots are full by either token
end

def draw?(board)
  full?(board) && !won?(board) #returns draw if either board full and game not won
end

def over?(board)
  won?(board) || full?(board) #returns true for either won or full board
end

def winner(board)
    if winning_combo = won?(board)
      board[winning_combo.first] #returns who won or nil first
    end  
end