class Board
  def initialize()
    self.clear()
  end
  #displays the current board state
  def show()
    x, i = 0,0
    3.times do |x|
      3.times do |i|
        print @table[x][i]
        i+=1
      end
      puts
    end
  end

  def empty(row, column)
    if @table[row][column] == "-"
      return true
    else
     return false
    end
  end

  #places a tile in a specified location
  def place(row, column, type)
    @table[row][column] = type
  end 
  
  #checks for a winner
  def check()
    3.times do |n|
      if @table[n][0] == @table[n][1] && @table[n][0] == @table[n][2] && @table[n][0] != "-"
        return true
      end
    end
    3.times do |n|
      if @table[0][n] == @table[1][n] && @table[0][n] == @table[2][n] && @table[0][n] != "-"
        return true
      end
    end
    if @table[0][0] == @table[1][1] && @table[0][0] == @table[2][2] && @table[0][0] != "-"
      return true
    end
     
    if @table[0][2] == @table[1][1] && @table[0][2] == @table[2][0] && @table[0][2] != "-"
      return true
    end
  end

  #clears the board
  def clear
    @table = [["-","-","-"], ["-","-","-"], ["-","-","-"]]
  end
end


class Game
  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2   
  end 

  def show()
    @board.show
  end

  def check()
    @board.check
  end
  
  def turn(player)
    puts "player #{player}, which row would you like to place your tile on?"
    row = gets.to_i - 1
    puts "and which column?"
    column = gets.to_i - 1
    if @board.empty(row, column)
      @board.place(row, column, player)
    else
      puts "A tile is already there, select another spot"
      turn(player)
    end
  end

  def start()
    i = 1
    @playing = true
    while @playing
     if !@board.check()
        if i % 2 == 0
          self.turn(@player2)
          @board.show()
          message = @player2
        else
          self.turn(@player1)
          @board.show()
          message = @player1
        end
     else 
       puts "Game won!! Player #{message} wins!"
       @playing = false
      end
      i += 1
    end 
    @board.clear()
    print "Play Again?"
    response = gets
    self.start()
  end 
end 

player1 = "x"
player2 = "o"

board = Board.new()

game = Game.new(board, player1, player2)
game.start()
