# frozen_string_literal: true

require 'rails_helper'

describe 'visitor' do
  it 'visits gets started page' do
    visit '/get_started'
    expect(page).to have_content('Filter results by selecting a filter on the side bar of the')
  end
end
