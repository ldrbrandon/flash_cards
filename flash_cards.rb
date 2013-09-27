# this is just a test to check if this gets saved to git hub

class FileParser
  
  def self.parse_file(file)
    parsed_file_array = []
    array_of_pairs = []
    File.open(file).each do |row|
      parsed_file_array << row.chomp 
    end
    parsed_file_array.reject! { |item| item == " "} # remove elements that are " "
    # create the array of pairs with every pair of elements being the values of a hash
    parsed_file_array.each_slice(2) { |pair| array_of_pairs << {:term => pair[1], :definition => pair[0]} } 
    return array_of_pairs
  end

end


FileParser.parse_file('flashcard_sample.txt')
