# frozen_string_literal: true

require 'rails_helper'

describe 'A registered user' do
  it 'cannot go to admin pages' do
    user = create(:user, github_token: ENV['GITHUB_API_KEY'], github_username: 49_769_068, first_name: 'Leiya', last_name: 'Kenney')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    expect{visit "admin/dashboard"}.to raise_error( ActionController::RoutingError)
  end
end
