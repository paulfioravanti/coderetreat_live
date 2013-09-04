require 'active_record_spec_helper'
require 'coderetreat'

describe "Updating the status" do
  let(:coderetreat) do
    Coderetreat.create!(status: "not_started", location: "Chicago")
  end

  before do
    coderetreat.update_status "in_session"
    coderetreat.reload
  end

  it "updates the status" do
    expect(coderetreat.status).to eq("in_session")
  end

  describe "#available_next_statuses" do
    it "does not include the current status" do
      coderetreat = Coderetreat.new(status: 'on_break')
      expect(coderetreat.available_next_statuses).to_not include('on_break')
    end

    it "includes the other statuses" do
      coderetreat = Coderetreat.new(status: 'on_break')
      expect(coderetreat.available_next_statuses).to \
        include('in_session', 'not_started')
    end
  end
end