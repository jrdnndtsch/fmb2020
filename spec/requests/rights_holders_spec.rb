require 'rails_helper'

RSpec.describe "RightsHolders", type: :request do
  describe "GET /rights_holders" do
    it "works! (now write some real specs)" do
      get rights_holders_path
      expect(response).to have_http_status(200)
    end
  end
end
