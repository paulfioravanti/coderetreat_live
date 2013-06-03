require 'spec_helper'

describe Coderetreats::StatusController do
  describe "GET /edit" do
    let(:coderetreat) { double }
    it "assigns the coderetreat" do
      allow(Coderetreat).to receive(:find).with("5").and_return(coderetreat)
      get :edit, coderetreat_id: "5"
      expect(assigns(:coderetreat)).to be(coderetreat)
    end
  end

  describe "PUT /update" do
    let(:status_updater) { double(update_to: nil) }

    before do
      # stub_const("CoderetreatLive::Coderetreats::Status", status_updater)
      allow(CoderetreatLive::Coderetreats::Status).to receive(:update_to)
    end

    it "redirects back to the edit status page" do
      put :update, coderetreat_id: "5", new_status: 'in_session'
      # expect(response).to redirect_to(edit_status_coderetreats_url("5"))
      expect(response).to redirect_to(edit_coderetreat_status_url("5"))
    end

    it "updates the status of the coderetreat" do
      # expect(status_updater).to receive(:update_to).with("5", 'in_session')
      expect(CoderetreatLive::Coderetreats::Status).to \
        receive(:update_to).with("5", 'in_session')
      put :update, coderetreat_id: "5", new_status: 'in_session'
    end
  end
end