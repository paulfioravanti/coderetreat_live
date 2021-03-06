require 'spec_helper'

feature 'Viewing the coderetreats running today' do
  given!(:coderetreats) do
    [
      Coderetreat.create!(status: 'not_started', location: 'Chicago'),
      Coderetreat.create!(status: 'not_started', location: 'Seattle'),
      Coderetreat.create!(status: 'in_session', location: 'Berlin')
    ]
  end

  background { visit running_today_coderetreats_url }

  scenario 'No coderetreats running today', %q(
    Given there are no coderetreats running today
    When I go to the running coderetreats display page
    Then I should see that there are no coderetreats running) do

    Coderetreat.destroy_all
    expect(page).to have_content('There are no coderetreats running today')
  end

  scenario 'Some coderetreats are running today', %q(
    Given there are some coderetreats running today
    When I go to the running coderetreats display page
    Then I should see the running coderetreats grouped by status) do

    coderetreats.each do |coderetreat|
      within(".#{coderetreat.status}") do
        expect(page).to have_css('.coderetreat', text: coderetreat.location)
      end
    end
  end
end