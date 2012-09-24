require_relative 'generic_parser'

class Lyric < GenericParser

  title 'Lyric Opera House'
  location '20 North Wacker Drive, Chicago, IL'
  uri 'https://www.lyricopera.org/calendar/index.aspx?monthDropDown=%Y:%m&filter=all'
  date_xpath "//div[@class='calendar_wrapper']//td[contains(@class,'hasOpera')]"

  def parse_date(date)
    self.day = date.xpath(".//span[@class='date']").text
    date.xpath("./div/div").map do |event|
      time = event.xpath("./p/span").text
      start_time = make_time(time)

      {
        :title => event.xpath("./h4/a").text(),
        :location => location,
        :start => start_time,
        :end => start_time + 10800,
        :url => 'http://www.lyricopera.org' + event.xpath("./h4/a").attr('href')
      }
    end
  end

end
