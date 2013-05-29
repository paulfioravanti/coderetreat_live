require 'coderetreats/presenters/collection'

describe CoderetreatLive::Coderetreats::Presenters::Collection do
  context "getting the coderetreats grouped by status" do
    it "exposes those in status not_started" do
      not_started = double('not_started', status: 'not_started')
      in_session = double('in_session', status: 'in_session')
      coderetreats = [not_started, in_session]
      presenter =
        CoderetreatLive::Coderetreats::Presenters::Collection.for(coderetreats)
      expect { |block| presenter.not_started(&block) }.to \
        yield_successive_args(not_started)
    end

    it "exposes those in status in_session" do
      not_started = double('not_started', status: 'not_started')
      in_session = double('in_session', status: 'in_session')
      coderetreats = [not_started, in_session]
      presenter =
        CoderetreatLive::Coderetreats::Presenters::Collection.for(coderetreats)
      expect { |block| presenter.in_session(&block) }.to \
        yield_successive_args(in_session)
    end
  end
end