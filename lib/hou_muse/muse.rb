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
     
  def self.muse(x)
    HouMuse::Scraper.sub_scrape(x)
  end
  
 
  def self.info(x)
    if HouMuse::Scraper.info_hash[x] == nil
      self.muse(x)
    else
      HouMuse::Scraper.info_hash[x]
    end
  end
  
  
end

