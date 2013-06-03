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
      CoderetreatLive::Coderetreats.stub(:running_today) do
        coderetreats_presenter
      end
      get :running_today
      expect(assigns(:coderetreats)).to be(coderetreats_presenter)
    end
  end

  describe "GET /edit_status" do
    it "assigns the coderetreat" do
      coderetreat = double
      Coderetreat.stub(:find).with("5") { coderetreat }
      get :edit_status, id: "5"
      expect(assigns(:coderetreat)).to be(coderetreat)
    end
  end
end