require_relative 'generic_parser'

class Auditorium < GenericParser

  title 'Auditorium Theater'
  location '50 East Congress Parkway, Chicago, IL'
  uri 'http://auditoriumtheatre.org/wb/pages/home/performances-events/calendar.php?date=%Y-%m-01'
  date_xpath "//table[@class='calendar']//td[@class='linkedweekendday' or @class='linkedweekday']"

  def parse_date(date)
    url_base = "http://auditoriumtheatre.org"
    self.day = date.xpath("./div[@class='dayTxt']").text
    date.xpath(".//div[@class='eventItem']").map do |event|
      time = event.xpath(".//div[@class='eventItemTxt']").inner_html
        .gsub(/.*<br>/, '').gsub(/[\(\)]/, '')
      start_time = make_time(time)

      {
        :title => event.xpath(".//div[@class='eventItemTxt']/a").attr('title').to_s,
        :location => location,
        :start => start_time,
        :end => start_time + 7200,
        :url => url_base + event.xpath(".//div[@class='eventItemTxt']/a").attr('href').to_s
      }
    end
  end

end
