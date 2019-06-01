class TicTacToe
  attr_reader :player1, :player2

  P1_SIGN = 'X'
  P2_SIGN = 'O'

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @playfield = playfield(1)
    @turn = @player1
    @round = 0
  end

  def display
    puts "___|_1_|_2_|_3_"
    puts "_1_|_#{@a[0][0]}_|_#{@a[0][1]}_|_#{@a[0][2]}_"
    puts "_2_|_#{@a[1][0]}_|_#{@a[1][1]}_|_#{@a[1][2]}_"
    puts " 3 | #{@a[2][0]} | #{@a[2][1]} | #{@a[2][2]} "
  end

  def make_turn
    pick = get_input

    if (@a[pick[0]-1][pick[1]-1] != P1_SIGN) && (@a[pick[0]-1][pick[1]-1] != P2_SIGN)
      if @turn == @player1
        @a[pick[0]-1][pick[1]-1] = P1_SIGN
        @turn = @player2
      else
        @a[pick[0]-1][pick[1]-1] = P2_SIGN
        @turn = @player1
      end
      @round += 1
      if self.game_over?
        puts "Game Over!"
        self.display
        return true
      end
      self.display
    else
      puts "Invalid Input"
    end
    false
  end

  protected

  # def to_s
  #   "Player 1: #{player1} \nPlayer 2: #{player2} \n "
  # end

  def game_over?
    if @round >= 9
      return true
    end
    for i in (0..2)
      if (@a[0][i] == P1_SIGN) && (@a[1][i] == P1_SIGN) && (@a[2][i] == P1_SIGN)
        return true
      elsif (@a[0][i] == P2_SIGN) && (@a[1][i] == P2_SIGN) && (@a[2][i] == P2_SIGN)
        return true
      elsif (@a[i][0] == P1_SIGN) && (@a[i][1] == P1_SIGN) && (@a[i][2] == P1_SIGN)
        return true
      elsif (@a[i][0] == P2_SIGN) && (@a[i][1] == P2_SIGN) && (@a[i][2] == P2_SIGN)
        return true
      end
    end
    if (@a[0][0] == P1_SIGN) && (@a[1][1] == P1_SIGN) && (@a[2][2] == P1_SIGN)
      return true
    elsif (@a[0][0] == P2_SIGN) && (@a[1][1] == P2_SIGN) && (@a[2][2] == P2_SIGN)
      return true
    elsif (@a[2][0] == P1_SIGN) && (@a[1][1] == P1_SIGN) && (@a[0][2] == P1_SIGN)
      return true
    elsif (@a[2][0] == P2_SIGN) && (@a[1][1] == P2_SIGN) && (@a[0][2] == P2_SIGN)
      return true
    end
    false
  end

  private 

  def playfield(action)
    if action == 1
      @a = [['_', '_', '_'], ['_', '_', '_'], ['_', '_', '_']] 
    end
  end

  def get_input
    pick = 0
    until (1..3).include?(pick[0]) && (1..3).include?(pick[1])
      puts "Choose a field (row, column)"
      pick = gets.chomp
      pick = pick.split(',')
      pick[0] = pick[0].to_i 
      pick[1] = pick[1].to_i 
    end
    pick
  end


end



game1 = TicTacToe.new("Hanna", "Tobi")
game_over = false

while game_over == false
  game_over = game1.make_turn
end

