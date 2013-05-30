require 'coderetreats/presenters/collection'
require 'coderetreats'

describe CoderetreatLive::Coderetreats do
  describe ".running_today" do
    # it "returns the collection wrapped in a presenter" do
    it "wraps the coderetreats running today in a presenter" do
      running_today = double('coderetreats')
      stub_const('::Coderetreat', stub(running_today: running_today))
      presenter = double
      CoderetreatLive::Coderetreats::Presenters::Collection
        .stub(:for)
        .with(running_today) do
        presenter
      end
      expect(CoderetreatLive::Coderetreats.running_today).to be(presenter)
    end
  end
end