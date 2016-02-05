require 'nokogiri'
require 'open-uri'

class RestaurantFetcher
  def initialize
  end

  def restaurants
    @restaurants ||=
      doc.css(".restaurant--details").map do |details|
        Restaurant.new(
          name: details.css(".restaurant-name").text.strip,
          url:  details.xpath("a").first['href']
        )
      end
  end

  def url
    # Currently hard coded for our office. Customize later.
    "https://deliveroo.co.uk/restaurants/london/hoxton?postcode=N1%207LJ&time=ASAP&day=today"
  end

  def file
    open(url)
  end

  def doc
    Nokogiri::HTML(file)
  end
end
