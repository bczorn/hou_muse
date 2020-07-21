class HouMuse::CLI
  
  def call
    welcome
    list_muse
  end
  
  def welcome
    puts "Welcome to the Houston Museum District!"
  end
  
  def goodbye
    puts ""
    puts "Thank you for visiting, come back soon!"
    puts ""
  end
  
  def list_muse
    @muse = HouMuse::Muse.today
    @muse.each.with_index(1) do |muse, i|
      puts "#{i}. #{muse.name}"
    end
    menu
  end
  
  def menu
    puts ""
    puts "Please enter the number of the museum you would like more information on. Type LIST for the list of museums, or type EXIT."
    input = gets.strip.downcase
    
    if input.to_i > 0
      current_muse = @muse[input.to_i-1]
      puts <<~DOC
      
      ------------------------
      #{current_muse.name.upcase}
      ------------------------
      #{current_muse.info}
      
      DOC
      menu
    elsif input == "list"
      list_muse
    elsif input == "exit"
      goodbye
    else
      puts "Input is invalid. Type LIST or EXIT."
    end
  end
  
end

