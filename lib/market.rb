class Market < Vendor 

  attr_reader :name,
              :vendors

  def initialize(name, vendors=[])
    @name = name
    @vendors = vendors
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

  def total_inventory

    #reports qunaitites of all items sold - hash with
    #items as keys and quants as values
  end
end
