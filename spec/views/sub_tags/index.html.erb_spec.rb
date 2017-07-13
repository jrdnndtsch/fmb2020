require 'rails_helper'

RSpec.describe "sub_tags/index", type: :view do
  before(:each) do
    assign(:sub_tags, [
      SubTag.create!(
        :name => "Name",
        :tag => nil
      ),
      SubTag.create!(
        :name => "Name",
        :tag => nil
      )
    ])
  end

  it "renders a list of sub_tags" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
