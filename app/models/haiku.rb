class Haiku 
  include ActiveModel::Validations
  include HaikuChecker
  
  attr_accessor :line1, :line2, :line3
  attr_accessor :line1_valid, :line2_valid, :line3_valid, :valid, :checked

  def initialize
    @line1 = "An old silent pond,"
    @line2 = "A frog jumps into the pond,"
    @line3 = "Splash! Silence again."
    @checked = false;
  end
  
  def check
    @checked = true;
    @line1_valid = HaikuChecker.check(@line1, 5)
    @line2_valid = HaikuChecker.check(@line2, 7)
    @line3_valid = HaikuChecker.check(@line3, 5)
    @valid = @line1_valid && @line2_valid && @line3_valid
  end
end
