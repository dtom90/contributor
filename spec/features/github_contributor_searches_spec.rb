require 'rails_helper'

RSpec.feature "GitHub Contributor Searches", type: :feature do
  it 'gets the home page' do
    visit '/'
    expect(page).to have_text('GitHub Contributor', 'Username', 'Get Contributions')
  end
end
