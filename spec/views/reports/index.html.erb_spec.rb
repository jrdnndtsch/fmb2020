require 'rails_helper'

RSpec.describe "reports/index", type: :view do
  before(:each) do
    assign(:reports, [
      Report.create!(
        :email => "Email"
      ),
      Report.create!(
        :email => "Email"
      )
    ])
  end

  it "renders a list of reports" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
