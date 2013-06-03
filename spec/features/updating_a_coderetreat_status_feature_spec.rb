require 'spec_helper'
require 'coderetreat'

feature 'Updating the status of a session' do
  given!(:not_started_coderetreat) do
    Coderetreat.create!(status: 'not_started', location: 'Chicago')
  end
  given!(:in_session_coderetreat) do
    Coderetreat.create!(status: 'in_session', location: 'Chicago')
  end

  scenario 'coderetreat is in session' do
    visit edit_status_coderetreats_path(not_started_coderetreat)
    click_button 'Start Session'
    expect(page).to \
      have_css('.in_session .coderetreat',
        text: not_started_coderetreat.location)
  end

  scenario 'starting a break' do
    visit edit_status_coderetreats_path(in_session_coderetreat)
    click_button 'Start Break'
    expect(page).to \
      have_css('.on_break .coderetreat',
        text: not_started_coderetreat.location)
  end
end