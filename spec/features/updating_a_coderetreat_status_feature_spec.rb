require 'spec_helper'

feature 'Updating the status of a session' do
  given!(:not_started_coderetreat) do
    Coderetreat.create!(status: 'not_started', location: 'Chicago')
  end
  given!(:in_session_coderetreat) do
    Coderetreat.create!(status: 'in_session', location: 'Chicago')
  end

  scenario 'starting a session', %q(
    Given a coderetreat that has not started
    When I start the coderetreat
    And I go to the running coderetreats display page
    Then I should see that the coderetreat is in session) do

    visit edit_coderetreat_status_url(not_started_coderetreat)
    click_button 'In Session'
    visit running_today_coderetreats_url
    expect(page).to \
      have_css('.in_session .coderetreat',
        text: not_started_coderetreat.location)
  end

  scenario 'starting a break', %q(
    Given a coderetreat that is in session
    When I start a break for the coderetreat
    And I go to the running coderetreats display page
    Then I should see that the coderetreat is on break) do

    visit edit_coderetreat_status_url(in_session_coderetreat)
    click_button 'On Break'
    visit running_today_coderetreats_url
    expect(page).to \
      have_css('.on_break .coderetreat',
        text: in_session_coderetreat.location)
  end
end