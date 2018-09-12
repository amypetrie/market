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
    #returns list of all items vendors have in stock alphabeticaly, items listed once
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
    return @total_inventory
  end

end
