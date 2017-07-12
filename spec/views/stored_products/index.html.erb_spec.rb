require 'rails_helper'

RSpec.describe "stored_products/index", type: :view do
  before(:each) do
    assign(:stored_products, [
      StoredProduct.create!(
        :title => "Title",
        :body_html => "Body Html",
        :vendor => "Vendor",
        :product_type => "Product Type",
        :published => false
      ),
      StoredProduct.create!(
        :title => "Title",
        :body_html => "Body Html",
        :vendor => "Vendor",
        :product_type => "Product Type",
        :published => false
      )
    ])
  end

  it "renders a list of stored_products" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Body Html".to_s, :count => 2
    assert_select "tr>td", :text => "Vendor".to_s, :count => 2
    assert_select "tr>td", :text => "Product Type".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
