class HouMuse::CLI
  
  def call
    welcome
    list_muse
  end
  
  def welcome
    puts "Welcome to the Houston Museum District!"
    puts "The goal of this program is to help plan your next trip to the Houston Museum District."
    scrape_main
  end
  
  def goodbye
    puts ""
    puts "Thank you for visiting, come back soon!"
    puts ""
  end
  
  def scrape_main
    @main = HouMuse::Muse.main
  end
  
  def list_muse
    puts ""
    @main.each.with_index(1) do |muse, i|
      puts "#{i}. #{muse.name}"
    end
    menu
  end
  
  def menu
    puts ""
    puts "Please enter the number of the museum you would like more information on. Type LIST for the list of museums, or type EXIT."
    input = gets.strip.downcase
    
    if (1..19) === input.to_i
      index = input.to_i - 1
      current_muse = @main[index]
      HouMuse::Muse.all[index].muse(index)
      
      puts <<~DOC
      
      ---------------------------
      #{current_muse.name}
      ---------------------------
      #{current_muse.info}
      
      ---------------------------
      #{current_muse.nearby}
    
      ---------------------------
      
      DOC
      menu
    elsif input == "list"
      list_muse
    elsif input == "exit"
      goodbye
    else
      puts ""
      puts "Input is invalid."
      menu
    end
  end
  
end

