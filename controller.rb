require_relative 'flash_cards.rb'
require_relative 'card_classes.rb'

class Controller

  def initialize(file)
    @file = file
    @hash_from_parsed_file = ask_to_parse(@file)
    @set = ask_to_create_set_from_parsed_file(@hash_from_parsed_file)
    @messages = { intro: "Welcome to Flash Cards Drill", correct: "correct", incorrect: "oops incorrect, please try again", question: "Please type in the term for the following definition", clear: "\e[2J\e[f", title: "Flash Cards Drill"}
    #dummy_variable
  end

  def run!
    clear_screen
    size_of_set = ask_set_for_size
    Viewer.render(@messages[:intro])
    #assume at least 1 flashcard in set
    current_flash_index = 0
    while current_flash_index < size_of_set
      current_flashcard = ask_model_for_flashcard(current_flash_index)
      #Viewer.render(current_flashcard.definition)
      #dummy - below
      Viewer.render(@messages[:title]) unless current_flash_index == 0
      Viewer.render(@messages[:question])
      Viewer.render(current_flashcard.definition)
      user_answer = get_answer_from_user
      if answer_correct?({answer: user_answer, flashcard: current_flashcard})
        clear_screen
        Viewer.render(@messages[:correct])
        Viewer.render("#{current_flashcard.term}: #{current_flashcard.definition}")
        current_flash_index +=1
      else
        Viewer.render(@messages[:incorrect])
      end
    end
  end

  #private
  def clear_screen
    Viewer.render(@messages[:clear])
  end

  def ask_to_parse(file)
    FileParser.parse(file)
  end      

  def ask_to_create_set_from_parsed_file(hash_from_parsed_file)
        SetOfFlashCards.new(hash_from_parsed_file)
        #dummy
        # puts "ask_to_create_set - input hash return set of flash cards object"
        # return 10
  end

  def ask_model_for_flashcard(card_num)
   @set.get_flashcard(card_num)
   #dummy
   # puts "returning flash card #{card_num}"
   # @flashcard
  end

  def ask_set_for_size
    @set.size
    # puts "ask_for_size- return size of set(integer) " 
    # return 3
  end

  def ask_viewer_to_render(message)
    Viewer.render(message)
  end

  def get_flashcard_info(flashcard)
  end

  def get_answer_from_user
    gets.chomp
  end

  def answer_correct?(input)
    input[:answer] == input[:flashcard].term
  end

  def create_message_correct_or_incorrect(correct)
  end
end


class Viewer
  def self.render(message)
    puts message
  end
end

game = Controller.new('flashcard_sample.txt')
game.run!

