require 'spec_helper'
require 'coderetreat'

feature 'Updating the status of a session' do
  given!(:coderetreat) do
    Coderetreat.create!(status: 'not_started', location: 'Chicago')
  end
  # background do
  #   visit edit_status_coderetreats_path(id: coderetreat.id)
  #   click_button 'Start Session'
  # end

  scenario 'coderetreat is in session' do
    visit edit_status_coderetreats_path(id: coderetreat)
    click_button 'Start Session'
    expect(page).to \
      have_css('.in_session .coderetreat', text: coderetreat.location)
  end
end