require 'spec_helper'

# Coderetreat = Struct.new(:status, :location)

feature 'Viewing the coderetreats running today' do

  # given(:no_code_retreats) { Coderetreat.destroy_all }

  given!(:coderetreats) do
    [
      # Coderetreat.new('not_started', 'Chicago'),
      # Coderetreat.new('not_started', 'Seattle'),
      # Coderetreat.new('in_session', 'Berlin')
      Coderetreat.create!(status: 'not_started', location: 'Chicago'),
      Coderetreat.create!(status: 'not_started', location: 'Seattle'),
      Coderetreat.create!(status: 'in_session', location: 'Berlin')
    ]
  end

  background { visit running_today_coderetreats_url }

  scenario 'No coderetreats running today' do
    Coderetreat.destroy_all
    expect(page).to have_content('There are no coderetreats running today')
  end

  scenario 'Some coderetreats are running today' do
    coderetreats.each do |coderetreat|
      within(".#{coderetreat.status}") do
        expect(page).to have_css('.coderetreat', text: coderetreat.location)
      end
    end
  end
end