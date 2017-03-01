require 'rails_helper'

RSpec.describe ReportsController, type: :controller do

  describe "GET #purchases" do
    it "returns http success" do
      get :purchases
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #sales" do
    it "returns http success" do
      get :sales
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #earnings" do
    it "returns http success" do
      get :earnings
      expect(response).to have_http_status(:success)
    end
  end

end
