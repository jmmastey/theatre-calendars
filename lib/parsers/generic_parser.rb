require 'nokogiri'
require 'open-uri'

class GenericParser

  def self.title(str)
    define_method :title do
      str
    end
  end

  def self.uri(str)
    define_method :uri do
      str
    end
  end

  def self.location(str)
    define_method :location do
      str
    end
  end

  def fetch_page(date)
    Nokogiri::HTML(open(uri.gsub("%d", date)))
  end
  private :fetch_page


end
