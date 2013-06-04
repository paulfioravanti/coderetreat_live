require 'spec_helper'

describe CoderetreatsController do
  describe "GET /running_today" do
    let(:coderetreats_presenter) { double }

    before do
      allow(CoderetreatLive::Coderetreats).to \
        receive(:running_today).and_return(coderetreats_presenter)
      get :running_today
    end

    it "gets the coderetreats running today" do
      expect(assigns(:coderetreats)).to be(coderetreats_presenter)
    end
  end
end