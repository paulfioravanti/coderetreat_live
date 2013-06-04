require 'spec_helper'
require_relative '../../../app/controllers/coderetreats/status_controller'

describe Coderetreats::StatusController do
  describe "GET /edit" do
    let(:coderetreat) { double }

    before do
      allow(::Coderetreat).to receive(:find).with("5").and_return(coderetreat)
      get :edit, coderetreat_id: "5"
    end

    it "assigns the coderetreat" do
      expect(assigns(:coderetreat)).to be(coderetreat)
    end
  end

  describe "PUT /update" do
    before do
      allow(CoderetreatLive::Coderetreats::Status).to receive(:update_to)
    end

    it "redirects back to the edit status page" do
      put :update, coderetreat_id: "5", new_status: 'in_session'
      expect(response).to redirect_to(edit_coderetreat_status_url("5"))
    end

    it "updates the status of the coderetreat" do
      expect(CoderetreatLive::Coderetreats::Status).to \
        receive(:update_to).with("5", 'in_session')
      put :update, coderetreat_id: "5", new_status: 'in_session'
    end
  end
end