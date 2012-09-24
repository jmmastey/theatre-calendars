require 'nokogiri'
require 'open-uri'

class GenericParser

  attr_accessor :working_date, :day

  # DSL-style accessors, for fun
  def self.title(str); define_method(:title) { str }; end
  def self.uri(str); define_method(:uri) { str }; end
  def self.location(str); define_method(:location) { str }; end
  def self.date_xpath(str); define_method(:date_xpath) { str }; end

  def fetch_page
    Nokogiri::HTML(open(self.working_date.strftime(uri)))
  end
  private :fetch_page

  def parse_date(date)
    [ ]
  end

  def events(months = 3)
    events = []
    self.working_date = Date.today

    months.times do
      fetch_page.xpath(date_xpath).each do |date|
        events += parse_date(date)
      end
      self.working_date >>= 1
    end
    events
  end

  def make_time(time)
   Time.parse("#{self.working_date.year}-#{self.working_date.month}-#{self.day} #{time}")
  end

end
