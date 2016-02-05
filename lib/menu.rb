class Menu
  attr_accessor :url

  def initialize(url:)
    @url = url
  end

  def menu_groups
    @menu_groups ||=
      doc.css(".results-group").map do |details|
        MenuGroup.new(
          name: details.css("h3").text.strip,
          menu_items:
            details.css(".menu-item").map do
              MenuItem.new(
                name: item.css(".list-item-title").text.strip,
                description: item.css(".list-item-description").text.strip,
                price: item.css(".item-price").text.strip
              )
            end
        )
      end

  end

  def file
    open(url)
  end

  def doc
    Nokogiri::HTML(file)
  end
end
