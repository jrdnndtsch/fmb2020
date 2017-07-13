require 'rails_helper'

RSpec.describe "reviews/show", type: :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :quote => "Quote",
      :citation => "Citation",
      :publication => "Publication",
      :stored_product => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Quote/)
    expect(rendered).to match(/Citation/)
    expect(rendered).to match(/Publication/)
    expect(rendered).to match(//)
  end
end
