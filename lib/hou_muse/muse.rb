class HouMuse::Muse
  
  attr_accessor :name, :address, :info, :hours, :parking, :connect #, :events, :dining, :area
  
  def self.main
    self.main_scrape
    self.museums
  end
  
  def self.museums
    @museums
  end
  
  def self.urls
    @urls
  end
  
  def self.main_scrape
    @museums = []
    @urls = []
    doc = Nokogiri::HTML(open("http://houmuse.org/"))
    results = doc.css(".museum-nav-listing")
    results.each do |r|
      @museums << r.text.strip
      @urls << r.css("a").attribute("href").value
    end
  end
  
  def self.sub_scrape(x)
    x = x.to_i - 1
    url = @urls[x]
    site = Nokogiri::HTML(open(url))
    
    @name = site.css(".js-museum-name").text
    @info = site.css(".js-museum-description").text
    binding.pry
  end
  
end