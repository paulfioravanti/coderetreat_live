require 'coderetreats/presenters/collection'
Coderetreat = Struct.new(:status, :location)

class CoderetreatsController < ApplicationController
  def running_today
    # @coderetreats = Object.new
    # def @coderetreats.not_started(&block)
    #   [
    #     Coderetreat.new('not_started', 'Chicago'),
    #     Coderetreat.new('not_started', 'Seattle')
    #   ].each(&block)
    # end
    # def @coderetreats.in_session(&block)
    #   [
    #     Coderetreat.new('in_session', 'Berlin')
    #   ].each(&block)
    # end
    coderetreats = [
      Coderetreat.new('not_started', 'Chicago'),
      Coderetreat.new('not_started', 'Seattle'),
      Coderetreat.new('in_session', 'Berlin')
    ]
    @coderetreats =
      # CoderetreatLive::Coderetreats::Presenters::Collection.for(coderetreats)
      CoderetreatLive::Coderetreats.running_today
  end
end
