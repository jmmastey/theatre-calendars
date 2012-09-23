require_relative 'generic_parser'

class Steppenwolf < GenericParser

  title 'Steppenwolf Theater'
  location '1650 North Halsted Street, Chicago, IL'
  uri 'https://www.steppenwolf.org/Plays-Events/Calendar.aspx?monthyear=%d&type=all'

  def events
    events = []
    working_date = Date.today
    date_xpath = "//ul[@class='calendar']//li[contains(@class,'curMonthDay')]"

    0.upto 1 do |n|
      fetch_page(working_date.strftime("%m-%Y")).xpath(date_xpath).each do |date|
        day = date.xpath(".//span[@class='dayNumber']").text.gsub(/[^0-9]/, '')
        date.xpath(".//ul[@class='calEventList']//li").each do |event|
          time = event.xpath(".//div[@class='calendarEventTime']").text

          start_time = Time.parse("#{working_date.year}-#{working_date.month}-#{day} #{time}")
          end_time = start_time + 7200

          events << {
            :title => event.xpath(".//a").text(),
            :location => location,
            :start => start_time,
            :end => end_time,
            :url => event.xpath(".//a").attr('href').to_s
          }
        end
      end
      working_date >>= 1
    end

    events
  end

end
