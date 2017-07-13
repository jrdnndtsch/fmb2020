require 'rails_helper'

RSpec.describe "sub_tags/show", type: :view do
  before(:each) do
    @sub_tag = assign(:sub_tag, SubTag.create!(
      :name => "Name",
      :tag => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
