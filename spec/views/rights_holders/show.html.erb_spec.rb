require 'rails_helper'

RSpec.describe "rights_holders/show", type: :view do
  before(:each) do
    @rights_holder = assign(:rights_holder, RightsHolder.create!(
      :name => "Name",
      :website => "Website",
      :email => "Email",
      :stored_product => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(//)
  end
end
