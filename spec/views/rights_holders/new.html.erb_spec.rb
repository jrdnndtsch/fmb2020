require 'rails_helper'

RSpec.describe "rights_holders/new", type: :view do
  before(:each) do
    assign(:rights_holder, RightsHolder.new(
      :name => "MyString",
      :website => "MyString",
      :email => "MyString",
      :stored_product => nil
    ))
  end

  it "renders new rights_holder form" do
    render

    assert_select "form[action=?][method=?]", rights_holders_path, "post" do

      assert_select "input#rights_holder_name[name=?]", "rights_holder[name]"

      assert_select "input#rights_holder_website[name=?]", "rights_holder[website]"

      assert_select "input#rights_holder_email[name=?]", "rights_holder[email]"

      assert_select "input#rights_holder_stored_product_id[name=?]", "rights_holder[stored_product_id]"
    end
  end
end
