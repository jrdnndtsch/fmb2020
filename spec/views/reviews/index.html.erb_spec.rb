require 'rails_helper'

RSpec.describe "reviews/index", type: :view do
  before(:each) do
    assign(:reviews, [
      Review.create!(
        :quote => "Quote",
        :citation => "Citation",
        :publication => "Publication",
        :stored_product => nil
      ),
      Review.create!(
        :quote => "Quote",
        :citation => "Citation",
        :publication => "Publication",
        :stored_product => nil
      )
    ])
  end

  it "renders a list of reviews" do
    render
    assert_select "tr>td", :text => "Quote".to_s, :count => 2
    assert_select "tr>td", :text => "Citation".to_s, :count => 2
    assert_select "tr>td", :text => "Publication".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
