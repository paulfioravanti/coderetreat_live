require 'coderetreats/presenters/collection'
require 'coderetreats'

describe CoderetreatLive::Coderetreats do
  describe ".running_today" do
    let(:running_today) { double('coderetreats') }
    let(:presenter) { double }
    before { stub_const('::Coderetreat', double(running_today: running_today)) }
    # it "returns the collection wrapped in a presenter" do
    it "wraps the coderetreats running today in a presenter" do
      allow(CoderetreatLive::Coderetreats::Presenters::Collection).to \
        receive(:for).with(running_today).and_return(presenter)
      expect(CoderetreatLive::Coderetreats.running_today).to be(presenter)
    end
  end
end