require 'spec_helper'

feature 'Viewing the coderetreats running today' do

  scenario 'No coderetreats running today' do
    visit running_today_coderetreats_url
    page.should have_content("There are no coderetreats running today")
  end

  scenario 'Some coderetreats are running today' do

  end
end