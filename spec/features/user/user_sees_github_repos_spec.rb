require 'rails_helper'

describe 'A registered user' do
  it 'I can see list of five github repos with name of each repo linked to repo on github', :vcr do
    json_response = File.open("./fixtures/github_repo_data.json")
    stub_request(:get, "https://api.github.com/user/repos").to_return(status: 200, body: json_response)

    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/dashboard"

    expect(page).to have_content("Github Section")

    within(".github") do
      expect(page).to have_css(".repo_name_and_link")
    end
  end

  it 'I can see list of all followers with their handles linking to their Github profile', :vcr do
    json_response = File.open("./fixtures/github_followers_data.json")
    stub_request(:get, "https://api.github.com/user/followers").to_return(status: 200, body: json_response)

    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/dashboard"

    expect(page).to have_content("Followers")

    within(".followers") do
      expect(page).to have_css(".username_and_link")
    end
  end
end

# As a logged in user
# When I visit /dashboard
# Then I should see a section for "Github"
# And under that section I should see another section titled "Followers"
# And I should see list of all followers with their handles linking to their Github profile
