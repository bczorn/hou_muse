class HouMuse::Muse
  
  attr_accessor :name, :address, :info, :hours, :parking, :connect #, :events, :dining, :area
  
  def self.today
    
    muse1 = self.new
    muse1.name = "ASIA SOCIETY TEXAS CENTER"
    muse1.info = "Asia Society Texas Center engages the diversity of Houston through enriching programs and events...."
    muse1.address = "address"
    muse1.hours = "hours & admission"
    muse1.parking = "directions and parking"
    muse1.connect = "phone, email, etc..."
    
    muse2 =  self.new
    muse2.name = "Muse 2 name"
    muse2.info = "Muse 2 info"
    
    [muse1, muse2]
  end
  
  def self.scrape_main
    museums = []
    
    doc = Nokogiri::HTML(open("http://houmuse.org/"))
    results = doc.css(".museum-nav-listing")
    results.each do |r|
      museums << r.text.strip
    end
    
    museums
    
  end
  
end