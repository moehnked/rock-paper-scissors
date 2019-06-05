class Game

  attr_reader :started, :finished

  def start
    @started = true
    @finished = false
  end

  def started?
    self.started || false
  end

  def finished?
    self.finished || false
  end

  def play(left = nil, right = nil)
    raise 'Game must first be started' unless started?
    return nil unless (left && right)
    return "Tie game. Try again!" unless (left != right)
    @finished = true;
    return "#{stringfy(winner(left, right)).capitalize} beats #{stringfy(loser(left, right))}!"
  end

  def winner(left, right)
    if (left_beats_right(left, right))
      return left
    else
      return right
    end
  end

  def loser(left, right)
    if (!left_beats_right(left, right))
      return left
    else
      return right
    end
  end

  def stringfy(hand)
    if (hand == :rock)
      return "rock"
    elsif (hand == :scissors)
      return "scissors"
    elsif (hand == :paper)
      return "paper"
    end  
  end

  def left_beats_right(left, right)
    if(left == :rock && right == :scissors)
      return true
    elsif (left == :scissors && right == :paper)
      return true
    elsif (left == :paper && right == :rock)
      return true
    else
      return false
    end
  end
end