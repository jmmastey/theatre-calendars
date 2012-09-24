require_relative 'generic_parser'

class Steppenwolf < GenericParser

  title 'Steppenwolf Theater'
  location '1650 North Halsted Street, Chicago, IL'
  uri 'https://www.steppenwolf.org/Plays-Events/Calendar.aspx?monthyear=%m-%Y&type=all'
  date_xpath "//ul[@class='calendar']//li[contains(@class,'curMonthDay')]"

  def parse_date(date)
    day = date.xpath(".//span[@class='dayNumber']").text.gsub(/[^0-9]/, '')
    date.xpath(".//ul[@class='calEventList']//li").map do |event|
      time = event.xpath(".//div[@class='calendarEventTime']").text

      start_time = Time.parse("#{self.working_date.year}-#{self.working_date.month}-#{day} #{time}")
      end_time = start_time + 7200

      {
        :title => event.xpath(".//a").text(),
        :location => location,
        :start => start_time,
        :end => end_time,
        :url => event.xpath(".//a").attr('href').to_s
      }
    end
  end

end
