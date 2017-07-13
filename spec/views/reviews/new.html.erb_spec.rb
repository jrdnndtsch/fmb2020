require 'rails_helper'

RSpec.describe "reviews/new", type: :view do
  before(:each) do
    assign(:review, Review.new(
      :quote => "MyString",
      :citation => "MyString",
      :publication => "MyString",
      :stored_product => nil
    ))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do

      assert_select "input#review_quote[name=?]", "review[quote]"

      assert_select "input#review_citation[name=?]", "review[citation]"

      assert_select "input#review_publication[name=?]", "review[publication]"

      assert_select "input#review_stored_product_id[name=?]", "review[stored_product_id]"
    end
  end
end
