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
end