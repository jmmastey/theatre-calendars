Dir["./lib/parsers/*.rb"].each { |file| require file }

require 'yaml'

class Calendar
  attr_accessor :calendars

  def initialize
    self.calendars = []
    config['calendars'].each do |cl|
      self.calendars << Kernel.const_get(cl).new
    end
  end

  def list
    calendars.map &:title
  end

  def events
    calendars.map &:events
  end

  def [](str)
    calendars.select { |c| c.title == str }.first
  end

  def config
    @config ||= YAML.load_file('config/calendar.yml')
  end

  def default_tzid
    config['default_tzid']
  end

end
