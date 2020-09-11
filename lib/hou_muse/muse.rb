class HouMuse::Muse
  
  attr_accessor :name, :url, :info, :nearby
  
  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def information(index,info, nearby)
    muse = @@all[index]
    muse.info = info
    muse.nearby = nearby
  end

  def self.main
    HouMuse::Scraper.main_scrape
    self.all
  end
     
  def muse(index)
    if self.already_scraped? == true
      return self
    else
      HouMuse::Scraper.sub_scrape(index, self.url)
    end
  end
 
  def already_scraped?
    self.info != nil
  end
  
  
end

