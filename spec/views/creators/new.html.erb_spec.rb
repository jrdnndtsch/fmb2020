require 'rails_helper'

RSpec.describe "creators/new", type: :view do
  before(:each) do
    assign(:creator, Creator.new(
      :type => "",
      :first_name => "MyString",
      :last_name => "MyString",
      :bio => "MyText",
      :stored_product => nil
    ))
  end

  it "renders new creator form" do
    render

    assert_select "form[action=?][method=?]", creators_path, "post" do

      assert_select "input#creator_type[name=?]", "creator[type]"

      assert_select "input#creator_first_name[name=?]", "creator[first_name]"

      assert_select "input#creator_last_name[name=?]", "creator[last_name]"

      assert_select "textarea#creator_bio[name=?]", "creator[bio]"

      assert_select "input#creator_stored_product_id[name=?]", "creator[stored_product_id]"
    end
  end
end
