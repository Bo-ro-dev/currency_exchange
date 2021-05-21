require 'rails_helper'

RSpec.describe "Exchanges", type: :request do

  describe "GET /show" do
    context "works fine" do
      it "returns HTTP 200" do
        get "/show"
        expect(response).to have_http_status(200)
      end

      it "do not set @rel_amount" do
        get "/show"
        expect(@rel_amount).to be_nil
      end
    end
  end
end
