module HaikuChecker
  class HaikuChecker
    def self.check(line, target_len)
      hc = self.new(line, target_len)
      hc.check
    end
    
    def initialize(line, target_len)
      @line = line
      @target_len = target_len
    end
    
    def check
      #lower case, remove punctuation marks, and split
      @split = @line.downcase.gsub(/[\?\.\!\,]/,'').split
      
      count_syllables
      case @word_counts.length
        when 0
          return false
        when 1
          return !@word_counts[0].index(@target_len).nil?
        else
          first = @word_counts.shift
          cross_product = first.product(*@word_counts)
          
          cross_product.each do |result|
            length = result.reduce(0) do |result, length|
              result + length
            end
            
            return true if length == @target_len
          end
      end
      
      return false
    end
    
    def count_syllables
      @word_counts = []      
      @split.each do |word|
        @word_counts.push Word.where(:word => word).map { |count| count.length }
      end
    end
  end
end