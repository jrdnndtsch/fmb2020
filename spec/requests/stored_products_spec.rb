require 'rails_helper'

RSpec.describe "StoredProducts", type: :request do
  describe "GET /stored_products" do
    it "works! (now write some real specs)" do
      get stored_products_path
      expect(response).to have_http_status(200)
    end
  end
end
