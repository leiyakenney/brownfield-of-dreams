require 'rails_helper'

describe "A registered user" do
  it "can send an invite email to someone via their GitHub username with an email", :vcr do
    json_response = File.open('./fixtures/github_invite_data_with_email.json')
    stub_request(:get, 'https://api.github.com/users/leiyakenney').to_return(status: 200, body: json_response)

    user = create(:user, github_token: ENV["GITHUB_API_KEY"], github_username: 49769068, first_name: "Leiya", last_name: "Kenney")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    click_on "Send an Invite"
    expect(current_path).to eq(invite_path)

    fill_in :github_handle, with: "leiyakenney"
    click_on "Send Invite"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Successfully sent invite!")
  end

  it "can send an invite email to someone via their GitHub username without an email", :vcr do
    json_response = File.open('./fixtures/github_invite_data_no_email.json')
    stub_request(:get, 'https://api.github.com/users/joshsherwood1').to_return(status: 200, body: json_response)

    user = create(:user, github_token: ENV["GITHUB_API_KEY"], github_username: 49769068, first_name: "Leiya", last_name: "Kenney")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    click_on "Send an Invite"
    expect(current_path).to eq(invite_path)

    fill_in :github_handle, with: "joshsherwood1"
    click_on "Send Invite"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("The Github user you selected doesn't have an email address associated with their account.")
  end
end
