
# this is just a test to check if this gets saved to git hub

class FileParser
  
  # file parser will take a file as input
  # every pair of lines will get turned into a hash
  # first row = hash[:term] = "term"
  # second row = hash[:def] = "definition"
  def self.parse(csv_file)
    
    CSV.foreach(csv_file) do |row|

    end
  end

end
