require 'rails_helper'

RSpec.describe "sub_tags/new", type: :view do
  before(:each) do
    assign(:sub_tag, SubTag.new(
      :name => "MyString",
      :tag => nil
    ))
  end

  it "renders new sub_tag form" do
    render

    assert_select "form[action=?][method=?]", sub_tags_path, "post" do

      assert_select "input#sub_tag_name[name=?]", "sub_tag[name]"

      assert_select "input#sub_tag_tag_id[name=?]", "sub_tag[tag_id]"
    end
  end
end
