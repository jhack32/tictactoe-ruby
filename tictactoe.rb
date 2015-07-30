#Tic Tac Toe Game by Jack Huang

class TicTacToeGame

  def initialize
    puts "Welcome to Tic Tac Toe!"
    play?
  end

  def play?
    puts "Would you like to play? (Yes/No)"
    option_to_play = gets.chomp.downcase
    if option_to_play == "yes"
      start_game
    elsif option_to_play == "no"
      puts "Okay, maybe next time!"
      exit
    else
      puts "Please enter a valid option (yes/no)"
      play?
    end
  end

  def start_game
    puts ""
    puts "---------------------"
    puts "Here are the the rules and instructions!"
    puts "Enter a number between 1 and 9. (1 starting from the top left and 9 on the bottom right)"
    puts "You are X. The computer is O."
    puts "The board is shown below."
    puts "Good luck!"
    puts "---------------------"
    puts ""
    @moves = 1
    make_board
    display_board
    player_option
  end

#The board is created. Created by using a hash.

  def make_board
    @board = {
      "1" => " ",
      "2" => " ",
      "3" => " ",
      "4" => " ",
      "5" => " ",
      "6" => " ",
      "7" => " ",
      "8" => " ",
      "9" => " ",
    }
  end

# This displays the board to the player in the console.
  def display_board
    puts "#{@board["1"]} | #{@board["2"]} | #{@board["3"]}"
    puts "----------"
    puts "#{@board["4"]} | #{@board["5"]} | #{@board["6"]}"
    puts "----------"
    puts "#{@board["7"]} | #{@board["8"]} | #{@board["9"]}"

  end
# Player chooses where they want to place their mark (X). If it's already chosen
# then it will display a message telling them to choose another number.
# if it is not between 1-9, it will ask them to choose another number.
# If the board is full (9 tiles are filled) and nobody has won, it will send a message
# saying that it's full and ask if they want to play again.
  def player_option
    if @moves < 10
      puts "Enter a number from 1 through 9."
      option = gets.chomp.to_s
    else
      puts "The board is full! Tie!"
      play?
    end
      if (option.to_i < 1) || (option.to_i > 9)
        puts "Invalid Number!"
        player_option
      elsif @board[option] == " "
        @board[option] = "X"
        @moves += 1
        computer_option
        display_board
        check_win
      else
        puts "Please choose another number, that spot is already taken."
        option
      end
    end
# The computer will randomize a number, and place their mark (O) there.
# if the position is already taken, it will choose another number.and place the O in it.
#
    def computer_option
      c_option = rand(1..9) if @moves < 10
      cr_option = c_option.to_s
        if @board[cr_option] == "X"
          computer_option
        elsif @board[cr_option] == "O"
          computer_option
        else
          @board[cr_option] = "O"
          @moves += 1

      end
    end

# This checks the hash to see if it's occupied with XXX or OOO.
# It checks the 3 rows, 3 columns and 2 across
# If the spaces to win are occupied,
# then it will display a message and give the option to play again.
    def check_win
      winning_possibility = [[@board["1"],@board["2"],@board["3"]], [@board["4"],@board["5"],@board["6"]], [@board["7"],@board["8"],@board["9"]],
                            [@board["1"],@board["4"],@board["7"]], [@board["2"],@board["5"],@board["8"]], [@board["3"],@board["6"],@board["9"]],
                            [@board["1"],@board["5"],@board["9"]], [@board["3"],@board["5"],@board["7"]]]
      winning_possibility.each do |x,y,z|
        if (x + y + z) == "   "
          player_option
        elsif (x + y + z ) == "XXX"
          puts "Congratulation! You WIN! :D"
          play?
        elsif (x + y + z ) == "OOO"
          puts "The COMPUTER Wins! Maybe next time :("
          play?
        end
      end
    end
end

start = TicTacToeGame.new
