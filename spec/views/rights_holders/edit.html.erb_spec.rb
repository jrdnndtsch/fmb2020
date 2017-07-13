require 'rails_helper'

RSpec.describe "rights_holders/edit", type: :view do
  before(:each) do
    @rights_holder = assign(:rights_holder, RightsHolder.create!(
      :name => "MyString",
      :website => "MyString",
      :email => "MyString",
      :stored_product => nil
    ))
  end

  it "renders the edit rights_holder form" do
    render

    assert_select "form[action=?][method=?]", rights_holder_path(@rights_holder), "post" do

      assert_select "input#rights_holder_name[name=?]", "rights_holder[name]"

      assert_select "input#rights_holder_website[name=?]", "rights_holder[website]"

      assert_select "input#rights_holder_email[name=?]", "rights_holder[email]"

      assert_select "input#rights_holder_stored_product_id[name=?]", "rights_holder[stored_product_id]"
    end
  end
end
