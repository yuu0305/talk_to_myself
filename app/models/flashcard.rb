class Flashcard < ApplicationRecord
  validates_presence_of :word,:answer 
end
