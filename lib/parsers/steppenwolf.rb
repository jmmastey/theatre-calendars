require_relative 'generic_parser'

class Steppenwolf < GenericParser

  title 'Steppenwolf Theater'
  location '1650 North Halsted Street, Chicago, IL'
  uri 'https://www.steppenwolf.org/Plays-Events/Calendar.aspx?monthyear=%m-%Y&type=all'
  date_xpath "//ul[@class='calendar']//li[contains(@class,'curMonthDay')]"

  def parse_date(date)
    self.day = date.xpath(".//span[@class='dayNumber']").text.gsub(/[^0-9]/, '')
    date.xpath(".//ul[@class='calEventList']//li").map do |event|
      time = event.xpath(".//div[@class='calendarEventTime']").text
      start_time = make_date(day, time)

      {
        :title => event.xpath(".//a").text(),
        :location => location,
        :start => start_time,
        :end => start_time + 7200,
        :url => event.xpath(".//a").attr('href').to_s
      }
    end
  end

end
