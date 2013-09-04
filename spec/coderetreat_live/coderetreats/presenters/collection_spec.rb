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

    describe "#grouped_by_status" do
      it "yields the possible statuses of a coderetreat" do
        expected_statuses = [ "in_session", "on_break", "not_started"]
        presenter = CoderetreatLive::Coderetreats::Presenters::Collection.for([])
        presenter.grouped_by_status do |status, _|
          expected_statuses.delete(status)
        end
        expect(expected_statuses).to eq([])
      end

      it "yields the coderetreats associated to the statuses" do
        yielded_coderetreats = {}
        presenter.grouped_by_status do |status, coderetreats|
          yielded_coderetreats[status] = coderetreats
        end
        expect(yielded_coderetreats["in_session"]).to eq([in_session])
        expect(yielded_coderetreats["on_break"]).to eq([on_break])
        expect(yielded_coderetreats["not_started"]).to eq([not_started])
      end
    end
  end
end