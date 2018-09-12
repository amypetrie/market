class Market < Vendor

  attr_reader :name,
              :vendors,
              :total_inventory

  def initialize(name, vendors=[], total_inventory=Hash.new(0))
    @name = name
    @vendors = vendors
    @total_inventory = total_inventory
  end

  def add_vendor(vendor_object)
    @vendors << vendor_object
  end


  def vendor_names
    @vendors.inject([]) do |name_array, vendor|
      name_array << vendor.name
    end
  end

  def vendors_that_sell(item_string)
    @vendors.inject([]) do |vendor_array, vendor|
      if vendor.check_stock(item_string) > 0
        vendor_array << vendor
      else vendor_array
      end
    end
  end

  def sorted_item_list
    create_inventory.keys.sort
  end

  def create_inventory
    @vendors.each do |vendor|
      vendor.inventory.each do |item, number|
        if @total_inventory.keys.include?(item)
          @total_inventory[item] += number
        else @total_inventory[item] = number
        end
      end
    end
    @total_inventory
  end

  def sell(item, quantity)
    create_inventory
    if quantity > @total_inventory[item]
      false
    else
      reduce_inventory_once_sold(item, quantity)
      return true
    end
  end

  def reduce_inventory_once_sold(item, quantity)
    @vendors.each do |vendor|
      if vendor.inventory.include?(item) && (vendor.inventory[item] > 0)
        amount_still_needed = quantity - vendor.inventory[item]
        new_amount = vendor.inventory[item] - (quantity - amount_still_needed)
        vendor.reduce_inventory(item, new_amount)
      end
    break if amount_still_needed == 0
  end
end
end
