
class TicTacToe
    @new_array = []

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
    ]

    def initialize(board=nil)
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(num)
        num.to_i-1 
    end

    def move(index, token) 
        @board[index] = token
    end 

    def position_taken?(index)
        # @board[index] == " " ? false : true 
        @board[index] == "X" || @board[index] == "O"
    end

    def valid_move?(move_num)
        if move_num > 9 
            false
        elsif position_taken?(move_num) == true  
            false 
        else
            true
        end
    end

    def turn_count
        @new_array = []
        @board.each do |space|
            if space == "X"
                @new_array << space
            elsif space == "O"
                @new_array << space
            else
            end
        end
        @new_array.length 
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        num = gets.chomp
        move_num = input_to_index(num)
        if valid_move?(move_num) 
            move(move_num, current_player)
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.detect do |combo|
            @board[combo[0]] == @board[combo[1]] && @board[combo[2]] == @board[combo[0]] && @board[combo[0]] != " "
        end
    end

    def full?
        @board.all?{|square| square != " "} 
    end

    def draw?
        full? && !won? 
    end
    
    def over?
     full?  || won?  || draw? 
    end

    def winner
        won? ? @board[won?[0]] : nil 
    end

    def play 
        turn until over?
        if won?
            puts "Congratulations #{winner}!" 
        else 
            puts "Cat's Game!"
        end
    end

end


