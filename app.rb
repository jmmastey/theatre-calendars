require 'sinatra'
require 'tzinfo'
require 'ri_cal'
require_relative 'lib/calendar'

calendar = Calendar.new

get '/' do
  calendar.list.map do |cal|
    "<a href='/schedule/#{cal}'>#{cal}</a><br />"
  end
end

get '/schedule/:cal' do
  cal = calendar[params[:cal]]
  raise "Unknown calendar #{params[:cal]}" unless cal

  RiCal.Calendar do
    self.default_tzid = calendar.default_tzid

    cal.events.each do |ev|
      # build event
      event do
        summary ev[:title]
        description ev[:url]
        dtstart ev[:start]
        dtend ev[:end]
        location ev[:location]
      end
    end
  end.to_s
end
