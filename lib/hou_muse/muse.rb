class HouMuse::Muse
  
  attr_accessor :name, :address, :info, :hours, :parking, :connect #, :events, :dining, :area
  
  def self.main
    self.main_scrape
    self.museums
  end
  
  def self.museums
    @museums
  end
  
  def self.muse(x)
    self.sub_scrape(x)
    @info
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
    #@info = site.css(".js-museum-description").text
    @info = site.search('p').map(&:text) #returns node set
    # site.at('p').text  #only returns first node. not node set
    #site.css(".js-museum-description").children.select(&:element?)
    
    binding.pry
    #site.css(".js-museum-description").children.each do |i|
    #  until i == ("\r\n{Any}")
    #  puts i
      #binding.pry
    #end
  #end
  
  end
  
end