# set is given an array of hashes.
# array = [ {:term => "term",
#                 :definition => "definition" },
#               ]

# #Model - SetOfFlashCards - a set of Flashcard objects (takes in hashes with keys)
#  - will give a flashcard object(with number of flashcard parameter) and its size(# of flashcards)
#  #Flashcard object - will give description and term


class SetOfFlashCards
  attr_reader :terms_and_definitions, :set_of_flashcard_objects, :size
  #terms_and_definitions is the array of hashes
  #set_of_flashcard_objects is the array of FlashCard objects
  #size is size of set_of_flashcard_objects

  def initialize(terms_and_definitions) #terms_and_definitions should be an array of hashes.
    @terms_and_definitions = terms_and_definitions
    self.get_set #fills set_of_flashcard_objects with FlashCard objects
    @size = @set_of_flashcard_objects.length
  end

  def get_set #gets set from terms_and_definitions array of hashes
    @set_of_flashcard_objects = []
    @terms_and_definitions.each do |one_term_n_defn|
      @set_of_flashcard_objects << FlashCard.new(one_term_n_defn)
    end
    @set_of_flashcard_objects
  end

  def get_flashcard(index)
    @set_of_flashcard_objects[index]
  end#instantiated with the array of hashes
end


class FlashCard #instantiated with a single hash of terms and definitions
  attr_reader :single_term_and_defn, :term, :definition

  def initialize(single_term_and_defn)
    @single_term_and_defn = single_term_and_defn
    @term = @single_term_and_defn[:term]
    @definition = @single_term_and_defn[:definition]
  end
end



#testing SetOfCards shit
# terms_and_defn = [ {:term => "banana", :definition => "a yellow fruit"},
#                                 {:term => "brandon", :definition => "a guy that eats double decker sandwiches"},
#                                 {:term => "jeff", :definition => "a super organized, super dad"}
#                                 ]
# annies_set = SetOfFlashCards.new(terms_and_defn)
# # p annies_set. terms_and_definitions #shows array of hashes from input
# # annies_set.get_set #runs the method that takes the array of hashes as input, and returns an array of FlashCard objects
# # p annies_set.set_of_flashcard_objects #SetOfFlashCards.set_of_flashcard_objects gives you array of FlashCard objects
# # p annies_set.get_flashcard(2) #SetOfFlashCards.get_flashcard(2) returns the FlashCard object at index 2 in the set array
# p annies_set.size #SetOfFlashCards.size returns size of array of FlashCard objects

#testing FlashCard shit
# single_flashcard_terms_and_defn = {:term => "banana", :definition => "a yellow fruit"}
# single_flashcard = FlashCard.new(single_flashcard_terms_and_defn)
# p single_flashcard.single_term_and_defn #Flashcard.single_term_and_defn shows hash of term and definition
# p single_flashcard.term #Flashcard.term shows term from single flashcard
# p single_flashcard.definition #Flashcard.definition shows definition from single flashcard