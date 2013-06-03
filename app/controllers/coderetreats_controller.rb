# require 'coderetreats/presenters/collection'
# Coderetreat = Struct.new(:status, :location)
require 'coderetreats'

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
    # coderetreats = [
    #   Coderetreat.new('not_started', 'Chicago'),
    #   Coderetreat.new('not_started', 'Seattle'),
    #   Coderetreat.new('in_session', 'Berlin')
    # ]
    @coderetreats =
      # CoderetreatLive::Coderetreats::Presenters::Collection.for(coderetreats)
      CoderetreatLive::Coderetreats.running_today
  end

  def edit_status
    @coderetreat = Coderetreat.find(coderetreat_id)
  end

  def update_status
    CoderetreatLive::Coderetreats::Status.update_to(coderetreat_id,
      params[:new_status])
    redirect_to edit_status_coderetreats_url(coderetreat_id)
  end

  private

    def coderetreat_id
      params[:id]
    end
end
