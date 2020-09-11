class HouMuse::Scraper
  
    
  def self.main_scrape
    doc = Nokogiri::HTML(open("http://houmuse.org/"))
    results = doc.css(".museum-nav-listing")
    results.each do |r|
      museum = r.text.strip
      url = r.css("a").attribute("href").value
      HouMuse::Muse.new(museum, url)
    end
  end
   
  def self.sub_scrape(index)
 
    site = Nokogiri::HTML(open(url))
    
    @near = ""
    nearby = site.css("div.museum-nearby")
    @near << nearby.css(".section-header").text.strip
    @near << ":\n"
    nearby.css(".museum-card").each do |i|
      
      @info = i.text.strip.split.join(" ")
      @near << "\n"
      @near << @info
    end
    
   
    
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
    

    HouMuse::Muse.information(index, @info, @near)

  end

  
end