require_relative 'generic_parser'

class Auditorium < GenericParser

  title 'Auditorium Theater'
  location '50 East Congress Parkway, Chicago, IL'
  uri 'http://auditoriumtheatre.org/wb/pages/home/performances-events/calendar.php?date=%d'

  def events
    events = []
    date = Date.today
    event_xpath = "//table[@class='calendar']//td[@class='linkedweekendday' or @class='linkedweekday']"
    url_base = "http://auditoriumtheatre.org"

    0.upto 3 do |n|
      fetch_page(date.to_s).xpath(event_xpath).each do |event|
        day = event.xpath("./div[@class='dayTxt']").text
        time = event.xpath(".//div[@class='eventItemTxt']").inner_html
                .gsub(/.*<br>/, '').gsub(/[\(\)]/, '')

        start_time = Time.parse("#{date.year}-#{date.month}-#{day} #{time}")
        end_time = start_time + 7200

        events << {
          :title => event.xpath("//div[@class='eventItemTxt']/a").attr('title').to_s,
          :location => location,
          :start => start_time,
          :end => end_time,
          :url => url_base + event.xpath("//div[@class='eventItemTxt']/a").attr('title').to_s
        }
      end
      date <<= 1
    end

    events
  end

end
