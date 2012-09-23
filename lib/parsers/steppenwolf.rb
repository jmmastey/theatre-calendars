require_relative 'generic_parser'

class Steppenwolf < GenericParser

  title 'Steppenwolf Theater'
  location '1650 North Halsted Street, Chicago, IL'
  uri 'https://www.steppenwolf.org/Plays-Events/Calendar.aspx?monthyear=%d&type=all'

  def events
    events = []
    date = Date.today
    event_xpath = "//ul[@class='calendar']//td[@class='curMonthDay']"
    url_base = "http://steppenwolf.org"

    0.upto 3 do |n|
#      fetch_page(date.strftime("%m-%Y")).xpath(event_xpath).each do |event|
#        day = event.xpath("./div[@class='dayTxt']").text
#        time = event.xpath(".//div[@class='eventItemTxt']").inner_html
#                .gsub(/.*<br>/, '').gsub(/[\(\)]/, '')
#
#        start_time = Time.parse("#{date.year}-#{date.month}-#{day} #{time}")
#        end_time = start_time + 7200
#
#        events << {
#          :title => event.xpath("//div[@class='eventItemTxt']/a").attr('title').to_s,
#          :location => location,
#          :start => start_time,
#          :end => end_time,
#          :url => url_base + event.xpath("//div[@class='eventItemTxt']/a").attr('title').to_s
#        }
#      end
#      date <<= 1
    end

    events
  end

end
