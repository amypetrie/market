class Market

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
    #returns array of vendors names
  end

  def vendors_that_sell(item_string)
    @vendors.inject([]) do |vendor_array, vendor|
      if vendor.check_stock(item_string) > 0
        vendor_array << vendor
      else vendor_array
      end
    end
    #list of vendors w items in stock
  end

end
