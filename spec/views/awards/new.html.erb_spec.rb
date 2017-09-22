require 'rails_helper'

RSpec.describe "awards/new", type: :view do
  before(:each) do
    assign(:award, Award.new(
      :name => "MyString",
      :stored_product => nil
    ))
  end

  it "renders new award form" do
    render

    assert_select "form[action=?][method=?]", awards_path, "post" do

      assert_select "input#award_name[name=?]", "award[name]"

      assert_select "input#award_stored_product_id[name=?]", "award[stored_product_id]"
    end
  end
end
