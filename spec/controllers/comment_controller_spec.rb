require 'rails_helper'

RSpec.describe Api::V1::CommentController, type: :controller do
  describe "POST create" do
    it "has a 201 status code" do
      post :create, params: {text: "Rspec test", user_id: 1, event_id: 1}
      expect(response.status).to eq(201)
    end
  end

  describe "GET without_comment_reported" do
    it "has a 200 status code if exist comment without reporte" do
      get :without_comment_reported
      expect(response.status).to eq(200)
    end
  end

  describe "GET reported_comments" do
    it "has a 200 status code if exist comment with reporte" do
      get :reported_comments
      expect(response.status).to eq(200)
    end
  end
end
