require "rails_helper"

RSpec.feature 'User Search Instauser' do
  scenario 'visit visitor page' do
    visit root_path

    fill_in 'search', with: 'hailiescomett'
    click_button 'Search'

    expect(page).to have_text 'Menu'
  end
end
