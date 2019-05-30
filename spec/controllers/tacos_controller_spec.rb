require 'rails_helper'

RSpec.describe TacosController, type: :controller do
  describe "GET #index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "responds to" do
    it "responds to html by default" do
      get :index
      expect(response.content_type).to eq "text/html"
    end

    it "responds to json by visiting /tacos.json" do
      get :index, format: :json
      expect(response.content_type).to eq "application/json"
    end
  end

  describe "POST #create" do
    before do
      post :create, params: { taco: { meat: 'steak', rice: false, salsa: true, notes: 'Regular size please' } }
    end

    it "responds to JSON" do
      expect(response.content_type).to eq "application/json"
    end

    it "JSON body response should contain taco attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(["id", "meat", "rice", "salsa", "notes", "created_at", "updated_at"])
    end
  end

  describe "DELETE #destroy" do
    it "destroys taco" do
      test_taco = Taco.create(meat: 'chicken', rice: false, salsa: true, notes: 'Large size please')
      expect { delete :destroy, params: { id: test_taco.id } }.to change(Taco, :count).by(-1)
    end
  end
end
