require 'coderetreats/presenters/collection'
require 'coderetreats'

describe CoderetreatLive::Coderetreats do
  describe ".running_today" do
    let(:running_today) { double('coderetreats') }
    let(:presenter) { double }

    before do
      stub_const('::Coderetreat', double(running_today: running_today))
      allow(CoderetreatLive::Coderetreats::Presenters::Collection).to \
        receive(:for).with(running_today).and_return(presenter)
    end

    it "wraps the coderetreats running today in a presenter" do
      expect(CoderetreatLive::Coderetreats.running_today).to be(presenter)
    end
  end
end