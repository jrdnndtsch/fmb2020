require 'rails_helper'

RSpec.describe "creators/show", type: :view do
  before(:each) do
    @creator = assign(:creator, Creator.create!(
      :type => "Type",
      :first_name => "First Name",
      :last_name => "Last Name",
      :bio => "MyText",
      :stored_product => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
