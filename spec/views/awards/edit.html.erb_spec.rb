require 'rails_helper'

RSpec.describe "awards/edit", type: :view do
  before(:each) do
    @award = assign(:award, Award.create!(
      :name => "MyString",
      :stored_product => nil
    ))
  end

  it "renders the edit award form" do
    render

    assert_select "form[action=?][method=?]", award_path(@award), "post" do

      assert_select "input#award_name[name=?]", "award[name]"

      assert_select "input#award_stored_product_id[name=?]", "award[stored_product_id]"
    end
  end
end
