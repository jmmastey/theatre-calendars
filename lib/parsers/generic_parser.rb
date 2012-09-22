require 'nokogiri'
require 'open-uri'

class GenericParser

  def self.title(str); @@title = str; end
  def title; @@title; end
  def self.uri(str); @@uri = str; end
  def uri; @@uri; end
  def self.location(str); @@location = str; end
  def location; @@location; end

end
