require 'rails_helper'

RSpec.describe "stored_products/new", type: :view do
  before(:each) do
    assign(:stored_product, StoredProduct.new(
      :title => "MyString",
      :body_html => "MyString",
      :vendor => "MyString",
      :product_type => "MyString",
      :published => false
    ))
  end

  it "renders new stored_product form" do
    render

    assert_select "form[action=?][method=?]", stored_products_path, "post" do

      assert_select "input#stored_product_title[name=?]", "stored_product[title]"

      assert_select "input#stored_product_body_html[name=?]", "stored_product[body_html]"

      assert_select "input#stored_product_vendor[name=?]", "stored_product[vendor]"

      assert_select "input#stored_product_product_type[name=?]", "stored_product[product_type]"

      assert_select "input#stored_product_published[name=?]", "stored_product[published]"
    end
  end
end
