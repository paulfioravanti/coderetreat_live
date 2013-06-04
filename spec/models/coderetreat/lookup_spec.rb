require 'active_record_spec_helper'
require 'coderetreat'

describe "Looking up coderetreats" do
  describe ".running_today" do
    let(:in_session) do
      Coderetreat.create! location: "Chicago", status: 'in_session'
    end
    let(:not_started) do
      Coderetreat.create! location: "Seattle", status: 'not_started'
    end

    context "when there are no coderetreats" do
      before { Coderetreat.destroy_all }

      it "returns an empty list" do
        expect(Coderetreat.running_today).to be_empty
      end
    end

    it "returns all the coderetreats in the system" do
      expect(Coderetreat.running_today).to eq([in_session, not_started])
    end
  end
end