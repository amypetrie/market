require 'pry'
class Vendor
  attr_reader :name,
              :inventory

  def initialize(name, inventory=Hash.new(0))
    @name = name
    @inventory = inventory
  end

  def check_stock(wanted_item)
    wanted_item = wanted_item
    if @inventory.keys.include?(wanted_item)
      @inventory[wanted_item]
    else @inventory[wanted_item] = 0
    end
  end

  def stock(item, number)
    item = item
    check_stock(item)
    @inventory[item] += number
  end

  def reduce_inventory(item, new_amount)
    @inventory[item] = new_amount
  end

end
