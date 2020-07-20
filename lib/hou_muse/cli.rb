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
    case input
    when "1"
      puts "muse 1"
      menu
    when "2"
      puts "muse 2"
      menu
    when "3"
      puts "muse 3"
      menu
    when "4"
      puts "muse 4"
      menu
    when "5"
      puts "muse 5"
      menu
    when "6"
      puts "muse 6"
      menu
    when "7"
      puts "muse 7"
      menu
    when "8"
      puts "muse 8"
      menu
    when "9"
      puts "muse 9"
      menu
    when "10"
      puts "muse 10"
      menu
    when "11"
      puts "muse 11"
      menu
    when "12"
      puts "muse 12"
      menu
    when "13"
      puts "muse 13"
      menu
    when "14"
      puts "muse 14"
      menu
    when "15"
      puts "muse 15"
      menu
    when "16"
      puts "muse 16"
      menu
    when "17"
      puts "muse 17"
      menu
    when "18"
      puts "muse 18"
      menu
    when "19"
      puts "muse 19"
      menu
    when "list"
      list_muse
    when "exit"
      goodbye
    end
  end
  
end

