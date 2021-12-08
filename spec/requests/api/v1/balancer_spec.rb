require 'rails_helper'

RSpec.describe "Api::V1::Balancer", type: :request do
  describe "POST /balance" do
    it "success con string balanceado" do
      headers = { "ACCEPT" => "application/json" }
      post "/api/v1/balancer/balance", :params => { :balancer => {:text => "texto:balanceado"} }, :headers => headers
      expect(JSON.parse(response.body)["message"]).to eql("balanceado")
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      headers = { "ACCEPT" => "application/json" }
      post "/api/v1/balancer/balance", :params => { :balancer => {:text => "hola(mundo:nuevo :))"} }, :headers => headers
      expect(JSON.parse(response.body)["message"]).to eql("balanceado")
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      headers = { "ACCEPT" => "application/json" }
      post "/api/v1/balancer/balance", :params => { :balancer => {:text => "hola(mundo:nuevo))"} }, :headers => headers
      expect(JSON.parse(response.body)["message"]).to eql("desbalanceado")
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      headers = { "ACCEPT" => "application/json" }
      post "/api/v1/balancer/balance", :params => { :balancer => {:text => "(:)"} }, :headers => headers
      expect(JSON.parse(response.body)["message"]).to eql("balanceado")
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      headers = { "ACCEPT" => "application/json" }
      post "/api/v1/balancer/balance", :params => { :balancer => {:text => ":(("} }, :headers => headers
      expect(JSON.parse(response.body)["message"]).to eql("desbalanceado")
      expect(response).to have_http_status(:success)
    end
  end

end

