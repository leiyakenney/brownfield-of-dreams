# frozen_string_literal: true

require 'rails_helper'

describe 'visitor' do
  it 'visits about page' do
    visit '/about'
    expect(page).to have_content("This application is designed to pull in youtube information to populate tutorials from Turing School of Software and Design's youtube channel")
  end
end
