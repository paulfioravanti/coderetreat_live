require 'spec_helper'

feature 'Updating the status of a session' do
  given(:not_started_coderetreat) do
    Coderetreat.create!(status: 'not_started', location: 'Chicago')
  end
  background do
    visit edit_status_coderetreats_url(not_started_coderetreat)
    click_on 'Start Session'
  end
  scenario 'coderetreat is in session' do
    expect(page).to have_css('.in_session .coderetreat',
                             text: not_started_coderetreat.location)
  end

end