require 'coderetreats/status'

describe CoderetreatLive::Coderetreats::Status do
  describe ".update_to" do
    let(:coderetreat) { double }
    before { stub_const("::Coderetreat", double(find: coderetreat)) }

    it "tells the coderetreat to update its status" do
      expect(coderetreat).to receive(:update_status).with("in_session")
      CoderetreatLive::Coderetreats::Status.update_to("5", "in_session")
    end
  end
end