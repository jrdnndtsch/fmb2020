require 'rails_helper'

RSpec.describe "rights_holders/index", type: :view do
  before(:each) do
    assign(:rights_holders, [
      RightsHolder.create!(
        :name => "Name",
        :website => "Website",
        :email => "Email",
        :stored_product => nil
      ),
      RightsHolder.create!(
        :name => "Name",
        :website => "Website",
        :email => "Email",
        :stored_product => nil
      )
    ])
  end

  it "renders a list of rights_holders" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
