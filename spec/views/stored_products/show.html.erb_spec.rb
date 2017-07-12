require 'rails_helper'

RSpec.describe "stored_products/show", type: :view do
  before(:each) do
    @stored_product = assign(:stored_product, StoredProduct.create!(
      :title => "Title",
      :body_html => "Body Html",
      :vendor => "Vendor",
      :product_type => "Product Type",
      :published => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Body Html/)
    expect(rendered).to match(/Vendor/)
    expect(rendered).to match(/Product Type/)
    expect(rendered).to match(/false/)
  end
end
