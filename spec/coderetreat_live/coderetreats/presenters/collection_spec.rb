require 'coderetreats/presenters/collection'

describe CoderetreatLive::Coderetreats::Presenters::Collection do
  context "getting the coderetreats grouped by status" do
    let(:not_started) { double('not_started', status: 'not_started') }
    let(:in_session) { double('in_session', status: 'in_session') }
    let(:on_break) { double('on_break', status: 'on_break') }
    let(:coderetreats) { [not_started, in_session, on_break] }
    let(:presenter) do
      CoderetreatLive::Coderetreats::Presenters::Collection.for(coderetreats)
    end
    it "exposes those in status not_started" do
      expect { |block| presenter.not_started(&block) }.to \
        yield_successive_args(not_started)
    end

    it "exposes those in status in_session" do
      expect { |block| presenter.in_session(&block) }.to \
        yield_successive_args(in_session)
    end

    it "exposes those in status on_break" do
      expect { |block| presenter.on_break(&block) }.to \
        yield_successive_args(on_break)
    end
  end
end