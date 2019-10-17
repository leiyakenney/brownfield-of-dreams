# frozen_string_literal: true

require 'rails_helper'

describe 'Admin deletes a tutorial' do
  let(:admin) { create(:admin) }

  it 'deletes the videos associated with that tutorial as well' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    tutorial = create(:tutorial)
    video1 = create(:video, tutorial_id: tutorial.id, position: 1)

    visit admin_dashboard_path

    expect(page).to have_content(tutorial.title)

    click_button 'Destroy'

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to_not have_content(tutorial.title)
    expect(page).to have_content('This tutorial has been deleted.')
  end
end
