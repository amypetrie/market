class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(wanted_item)
    if @inventory.keys.include?(wanted_item)
      return @inventory[wanted_item]
    else @inventory[wanted_item] = 0
    end
  end
end
