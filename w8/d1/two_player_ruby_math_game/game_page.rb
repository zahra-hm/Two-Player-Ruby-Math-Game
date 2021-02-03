class Game
  attr_reader :p1, :p2

  def initialize
    @p1 = User.new(1, true)
    @p2 = User.new(2, false)
  end

  def play
    while (@p1.lives > 0 || @p2.lives > 0) do
      question = Questions.new()
      if @p1.turn
        puts "Player #{@p1.id}: What does #{question.num1} plus #{question.num2} equal?"
        if question.correct?
          puts "YES! You are correct."
        else
          puts "Seriously? No!"
          @p1.lives -= 1
        end

        @p1.turn = false
        @p2.turn = true

      elsif @p2.turn
        puts "Player #{@p2.id}: What does #{question.num1} plus #{question.num2} equal?"
        if question.correct?
          puts "YES! You are correct."
        else
          puts "Seriously? No!"
          @p2.lives -= 1
        end

        @p1.turn = true
        @p2.turn = false
      end

      if @p1.lives == 0
        puts "Player #{@p2.id} wins with a score of #{@p2.lives}/3"
        puts "----- GAME OVER -----"
        puts "Good bye!"
        exit
      elsif @p2.lives == 0
        puts "Player #{@p1.id} wins with a score of #{@p1.lives}/3"
        puts "----- GAME OVER -----"
        puts "Good bye!"
        exit
      else
        puts "P#{@p1.id}: #{@p1.lives}/3 vs P#{@p2.id}: #{@p2.lives}/3"
        puts "----- NEW TURN -----"
      end
    end
  end
end