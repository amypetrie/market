require 'pry'
class Vendor
  attr_reader :name,
              :inventory

  def initialize(name, inventory=Hash.new(0))
    @name = name
    @inventory = inventory
  end

  def check_stock(wanted_item)
    wanted_item = wanted_item.capitalize
    if @inventory.keys.include?(wanted_item)
      @inventory[wanted_item]
    else @inventory[wanted_item] = 0
    end
  end

  def stock(item, number)
    item = item.capitalize
    check_stock(item)
    @inventory[item] += number
  end

end
