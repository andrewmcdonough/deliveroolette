require 'nokogiri'
require 'open-uri'

class Restaurant
  attr_accessor :name, :url

  def initialize(name:, url:)
    @name = name
    @url = url
  end

  def menu
    @menu ||= Menu.new(@url)
  end
end
