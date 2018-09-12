require 'pry'
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

  def test_check_stock_for_new_item
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_equal 0, vendor.check_stock("peaches")
  end

  def test_stock_adds_items_to_inventory
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 30)

    assert_equal 30, vendor.check_stock("peaches")
  end

  def test_stock_adds_items_to_inventory
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 30)

    assert_equal 30, vendor.check_stock("Peaches")
  end

  def test_the_inventory_is_additive_when_stocked
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 30)
    vendor.stock("Peaches", 25)
    vendor.stock("Tomatoes", 12)
    expected = {"Peaches" => 55, "Tomatoes" => 12}

    assert_equal expected, vendor.inventory
  end

end
