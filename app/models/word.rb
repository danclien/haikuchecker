class Word < ActiveRecord::Base
  validates :word, :presence => true
  validates :length, :presence => true
end
