class HouMuse::CLI
  
  def call
    welcome
    list_muse
  end
  
  def welcome
    puts "Welcome to the Houston Museum District!"
  end
  
  def goodbye
    puts "Thank you for visiting, come back soon!"
  end
  
  def list_muse
    puts <<-DOC
    1. Asia Society Texas Center
    2....
    3....
    4...
    DOC
    menu
  end
  
  def menu
    puts "Please enter the number of the museum you would like more information on. Type LIST for the list of museums, or type EXIT."
    input = gets.strip.downcase
    
    if input.to_i > 0
      puts @muse[input.to_i-1]
    elsif input == "list"
      list_muse
    elsif input == "exit"
      goodbye
    else
      puts "Input is invalid. Type LIST or EXIT."
    end
  end
  
end

