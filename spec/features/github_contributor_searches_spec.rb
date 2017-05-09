require 'rails_helper'

RSpec.feature 'GitHub Contributor Searches', type: :feature do
  it 'gets the home page' do
    visit '/'
    expect(page).to have_content 'GitHub Contributor'
    expect(page).to have_content 'Username'
    expect(page).to have_button 'Get Contributions'
    
    # click_button 'Get Contributions'
    # expect(page).to have_text("can't be blank")
  end
end
