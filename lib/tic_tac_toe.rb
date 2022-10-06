class TicTacToe
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [2,5,8],
        [1,4,7],
        [0,4,8],
        [6,4,2]
      ]

    attr_accessor :board
    def initialize(board=[" "," "," "," "," "," "," "," "," "])
      @board = board
    end

    def display_board
        board.each_slice(3).map { |row| row.join(" | ") }.join("\n" + "-"*11 + "\n")
    end

    def input_to_index(user_input)
        user_input.to_i - 1
    end

    def move(index, play)
        board[index] = play
        board
    end

    def position_taken?(index)
        if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
           return false 
        else
           return true
        end
    end

    def valid_move?(index)
        if index.between?(0,8) && !position_taken?(board, index)
           return true
        end
    end

    def turn_count(board)
        counter = 0
        board.each do |spaces|
           if spaces == "X" || spaces == "O"
              counter += 1
           end
        end
        counter
    end

    def current_player(board)
        turn_count(board) % 2 == 0 ? "X" : "O"
    end

    def turn(board)
        puts "Please enter 1-9:"
        user_input = gets.strip
        index = input_to_index(user_input)
        if valid_move?(board, index)
           move(board, index, current_player(board))
           turn(board)
        end
        display_board(board)
    end
    
end