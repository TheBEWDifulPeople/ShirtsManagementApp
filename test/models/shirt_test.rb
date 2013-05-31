require 'test_helper'

class ShirtTest < ActiveSupport::TestCase
  test "tag list is empty if there are no tags" do
    shirt = Shirt.new name: "foo", description: "this is 10 characters long...", image: "foo.png"
    shirt.save
    assert_equal [], shirt.tag_list
  end

  test "tag lists take a string of categories" do
    shirt = Shirt.new name: "foo", description: "this is 10 characters long...", image: "foo.png"
    shirt.tag_list = "Foo, Bar, Baz"
    shirt.save

    assert_equal ["Foo", "Bar", "Baz"], shirt.tag_list

    assert_equal 3, shirt.categories.count
  end

  test "tag lists can be replaced" do
    shirt = Shirt.new name: "foo", description: "this is 10 characters long...", image: "foo.png"
    shirt.tag_list = "Foo, Bar, Baz"
    shirt.save

    shirt.tag_list = "Foo, Bar, Banana"
    shirt.save
    assert_equal ["Foo", "Bar", "Banana"], shirt.tag_list
    assert_equal 3, shirt.categories.count
  end


end







