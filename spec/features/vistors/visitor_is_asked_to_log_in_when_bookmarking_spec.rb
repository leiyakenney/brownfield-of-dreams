# frozen_string_literal: true

require 'rails_helper'

describe 'visitor visits video show page' do
  it 'clicks on the bookmark button and sees an error message to log in' do
    tutorial = create(:tutorial)
    video = create(:video, tutorial_id: tutorial.id, position: 1)

    visit tutorial_path(tutorial)

    expect(page).to have_content('User must log in to bookmark a video.')
    expect(page).to have_link "Log In Here"

    click_link "Log In Here"
    expect(current_path).to eq(login_path)
  end
end
