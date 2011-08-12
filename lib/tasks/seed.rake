
def find_length_from_split(split)
  split.reduce(0) do |length, sound|
    if ['0', '1', '2'].index(sound[-1,1])
      length + 1 
    else
      length
    end
  end  
end

namespace :haikuchecker do
  task :seed => :environment do
    Rake::Task['db:reset'].execute  
    
    dict_data = HTTParty.get('https://cmusphinx.svn.sourceforge.net/svnroot/cmusphinx/trunk/cmudict/cmudict.0.7a')
    dict_data.each_line do |line|
      next if !/[a-zA-Z]/.match(line[0])  #next if it doesn't start with a character
      
      split = line.split
      word = split.shift.downcase.sub(/\(.*\)/,'') #remove () from word
      length = find_length_from_split(split)
      
      Word.create :word => word, :length => length
    end
  end
end