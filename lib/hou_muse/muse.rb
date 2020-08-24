class HouMuse::Muse
  
  attr_accessor :name, :address, :info
  
  def self.main
    self.main_scrape
    self.museums
  end
  
  def self.main_scrape
    HouMuse::Scraper.main_scrape
  end

  def self.sub_scrape(x)
    HouMuse::Scraper.sub_scrape(x)
  end
  
  def self.museums
    HouMuse::Scraper.museums
  end
  
  def self.muse(x)
    self.sub_scrape(x)
  end
  
  def self.nearby(x)
    HouMuse::Scraper.near_hash[x]
  end
  
  def self.info(x)
    HouMuse::Scraper.info_hash[x]
  end
  
  def self.urls
    HouMuse::Scraper.urls
  end
  
  
end