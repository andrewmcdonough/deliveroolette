class MenuGroup
  attr_accessor :name, :menu_items

  def initialize(name:, menu_items:)
    @name = name
    @menu_items = menu_items
  end
end
