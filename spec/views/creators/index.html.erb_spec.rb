require 'rails_helper'

RSpec.describe "creators/index", type: :view do
  before(:each) do
    assign(:creators, [
      Creator.create!(
        :type => "Type",
        :first_name => "First Name",
        :last_name => "Last Name",
        :bio => "MyText",
        :stored_product => nil
      ),
      Creator.create!(
        :type => "Type",
        :first_name => "First Name",
        :last_name => "Last Name",
        :bio => "MyText",
        :stored_product => nil
      )
    ])
  end

  it "renders a list of creators" do
    render
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
