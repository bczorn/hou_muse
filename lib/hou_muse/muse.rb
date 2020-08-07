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
  end
  
  def self.nearby(x)
    @near_hash[x]
  end
  
  def self.info(x)
    @info_hash[x]
  end
  
  def self.urls
    @urls
  end
  
  def self.main_scrape
    @museums = []
    @urls = []
    @near_hash = Hash.new
    @info_hash = Hash.new
    doc = Nokogiri::HTML(open("http://houmuse.org/"))
    results = doc.css(".museum-nav-listing")
    results.each do |r|
      @museums << r.text.strip
      @urls << r.css("a").attribute("href").value
    end
  end
  
  def self.sub_scrape(x)
    url = @urls[x]
    site = Nokogiri::HTML(open(url))
    
    @near = ""
    nearby = site.css("div.museum-nearby")
    @near << nearby.css(".section-header").text.strip
    @near << ":\n"
    nearby.css(".museum-card").each do |i|
      @info = i.text.strip.split.join(" ")
    end
    @near << @info
    @near_hash[x] = @near
    
    @info = [" "]
    @name = site.css(".js-museum-name").text
    thingx = site.xpath("//p/preceding-sibling::*[1][name()='p']")
    thinge = site.xpath("//p[count(../p) = 1]")
    
    if thingx.count == 0
      @info << thinge[0].text
    else
      thingx.each {|i| @info << i.text}
    end
    @info = @info.join("\n    ")
    @info_hash[x] = @info
  end
  
end