module CoderetreatLive
  module Coderetreats
    module Presenters
      class Collection
        def self.for(coderetreats)
          new(coderetreats)
        end

        attr_reader :coderetreats
        def initialize(coderetreats)
          @coderetreats = coderetreats
        end

        def not_started(&block)
          self.coderetreats.select do |coderetreat|
            coderetreat.status == 'not_started'
          end.each(&block)
        end

        def in_session(&block)
          self.coderetreats.select do |coderetreat|
            coderetreat.status == 'in_session'
          end.each(&block)
        end
      end
    end
  end
end