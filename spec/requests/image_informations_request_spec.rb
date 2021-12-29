require 'rails_helper'

RSpec.describe "ImageInformations", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/image_informations/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/image_informations/new"
      expect(response).to have_http_status(:success)
    end
  end

end
