require 'sinatra'
require 'ri_cal'
require_relative 'lib/calendar'

calendar = Calendar.new

get '/' do
  calendar.list.map do |cal|
    "<a href='/schedule/#{cal}'>#{cal}</a>"
  end
end

get '/schedule/:cal' do
  events = calendar[params[:cal]].events
  RiCal.Calendar do
    events.each do |ev|
      # build event
      event do
        description ev[:title]
        dtstart ev[:start]
        dtend ev[:end]
        location ev[:location]
      end
    end
  end.to_s
end
