require 'rails_helper'

RSpec.describe "awards/index", type: :view do
  before(:each) do
    assign(:awards, [
      Award.create!(
        :name => "Name",
        :stored_product => nil
      ),
      Award.create!(
        :name => "Name",
        :stored_product => nil
      )
    ])
  end

  it "renders a list of awards" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
