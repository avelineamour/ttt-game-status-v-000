# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2],
  [0, 3, 6],
  [0, 4, 8],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6],
  [3, 4, 5],
  [6, 7, 8],
]

# My Won Method
# def won?(board)
#   WIN_COMBINATIONS.any? do |wincombo|
#     if  board[wincombo[0]] == board[wincombo[1]] &&
#         board[wincombo[1]] == board[wincombo[2]] &&
#         position_taken?(board, wincombo[1])
#       return wincombo
#     else false
#     end
#   end
# end

# Adopted Method
def won?(board)
  WIN_COMBINATIONS.detect { |win_combination|
    board[win_combination[0]] == board[win_combination[1]] &&
    board[win_combination[1]] == board[win_combination[2]] &&
    position_taken?(board, win_combination[0])
  }
end

def full?(board)
  board.all? do |space|
      space == "X" || space == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end


def winner(board)
  if won?(board).is_a? Array
    board[won?(board)[0]]
  else nil
    end
end
