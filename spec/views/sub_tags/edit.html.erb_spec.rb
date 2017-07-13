require 'rails_helper'

RSpec.describe "sub_tags/edit", type: :view do
  before(:each) do
    @sub_tag = assign(:sub_tag, SubTag.create!(
      :name => "MyString",
      :tag => nil
    ))
  end

  it "renders the edit sub_tag form" do
    render

    assert_select "form[action=?][method=?]", sub_tag_path(@sub_tag), "post" do

      assert_select "input#sub_tag_name[name=?]", "sub_tag[name]"

      assert_select "input#sub_tag_tag_id[name=?]", "sub_tag[tag_id]"
    end
  end
end
