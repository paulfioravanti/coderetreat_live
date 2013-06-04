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
end