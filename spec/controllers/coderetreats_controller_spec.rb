require 'spec_helper'

describe CoderetreatsController do
  describe "GET /running_today" do
    let(:coderetreats_presenter) { double }

    before do
      stub_const("CoderetreatLive::Coderetreats::Presenters::Collection",
        double(for: coderetreats_presenter))
    end
    # it "uses a coderetreats collection presenter" do
    it "gets the coderetreats running today" do
      # allow(CoderetreatLive::Coderetreats::Presenters::Collection).to \
      #   receive(:for).and_return(coderetreats_presenter)
      # allow(CoderetreatLive::Coderetreats).to \
      #   receive(:running_today).and_return(coderetreats_presenter)
      allow(CoderetreatLive::Coderetreats).to \
        receive(:running_today).and_return(coderetreats_presenter)
      get :running_today
      expect(assigns(:coderetreats)).to be(coderetreats_presenter)
    end
  end

  # describe "GET /edit_status" do
  #   let(:coderetreat) { double }
  #   it "assigns the coderetreat" do
  #     allow(Coderetreat).to receive(:find).with("5").and_return(coderetreat)
  #     get :edit_status, id: "5"
  #     expect(assigns(:coderetreat)).to be(coderetreat)
  #   end
  # end

  # describe "PUT /update_status" do
  #   let(:status_updater) { double(update_to: nil) }

  #   before do
  #     # stub_const("CoderetreatLive::Coderetreats::Status", status_updater)
  #     allow(CoderetreatLive::Coderetreats::Status).to receive(:update_to)
  #   end

  #   it "redirects back to the edit status page" do
  #     put :update_status, id: "5", new_status: 'in_session'
  #     # expect(response).to redirect_to(edit_status_coderetreats_url("5"))
  #     expect(response).to redirect_to(edit_coderetreat_status_url("5"))
  #   end

  #   it "updates the status of the coderetreat" do
  #     # expect(status_updater).to receive(:update_to).with("5", 'in_session')
  #     expect(CoderetreatLive::Coderetreats::Status).to \
  #       receive(:update_to).with("5", 'in_session')
  #     put :update_status, id: "5", new_status: 'in_session'
  #   end
  # end
end