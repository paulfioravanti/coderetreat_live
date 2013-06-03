require 'spec_helper'

describe CoderetreatsController do
  describe "GET /running_today" do
    # it "uses a coderetreats collection presenter" do
    it "gets the coderetreats running today" do
      coderetreats_presenter = double
      # stub_const("CoderetreatLive::Coderetreats::Presenters::Collection",
      #   stub(for: coderetreats_presenter))
      # CoderetreatLive::Coderetreats::Presenters::Collection.stub(:for) do
      #   coderetreats_presenter
      # end
      # CoderetreatLive::Coderetreats.stub(:running_today) do
      #   coderetreats_presenter
      # end
      allow(CoderetreatLive::Coderetreats).to \
        receive(:running_today).and_return(coderetreats_presenter)
      get :running_today
      expect(assigns(:coderetreats)).to be(coderetreats_presenter)
    end
  end

  describe "GET /edit_status" do
    it "assigns the coderetreat" do
      coderetreat = double
      allow(Coderetreat).to receive(:find).with("5").and_return(coderetreat)
      get :edit_status, id: "5"
      expect(assigns(:coderetreat)).to be(coderetreat)
    end
  end

  describe "PUT /update_status" do
    let(:status_updater) { double(update_to: nil) }

    before do
      stub_const("CoderetreatLive::Coderetreats::Status", status_updater)
    end

    it "redirects back to the edit status page" do
      put :update_status, id: "5", new_status: 'in_session'
      expect(response).to redirect_to(edit_status_coderetreats_url("5"))
    end

    it "updates the status of the coderetreat" do
      expect(status_updater).to receive(:update_to).with("5", 'in_session')
      put :update_status, id: "5", new_status: 'in_session'
    end
  end
end