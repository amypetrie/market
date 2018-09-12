require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'

class TestVendor < Minitest::Test

  def test_it_exists
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_instance_of Vendor, vendor
  end

  def test_it_has_a_name
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_equal "Rocky Mountain Fresh", vendor.name
  end

  def test_it_starts_with_empty_inventory
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal Hash.new, vendor.inventory
  end

  def check_stock(item)
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_equal 0, inventory.check_stock("peaches")
  end
  
end
