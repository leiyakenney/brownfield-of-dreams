require "rails_helper"

describe FollowedAccount, type: :model do

    before(:each) do
      @hash = {:login=>"MackHalliday",
               :id=>16658577,
               :node_id=>"MDQ6VXNlcjE2NjU4NTc3",
               :avatar_url=>"https://avatars2.githubusercontent.com/u/16658577?v=4",
               :gravatar_id=>"",
               :url=>"https://api.github.com/users/MackHalliday",
               :html_url=>"https://github.com/MackHalliday",
               :followers_url=>"https://api.github.com/users/MackHalliday/followers",
               :following_url=>"https://api.github.com/users/MackHalliday/following{/other_user}",
               :gists_url=>"https://api.github.com/users/MackHalliday/gists{/gist_id}",
               :starred_url=>"https://api.github.com/users/MackHalliday/starred{/owner}{/repo}",
               :subscriptions_url=>"https://api.github.com/users/MackHalliday/subscriptions",
               :organizations_url=>"https://api.github.com/users/MackHalliday/orgs",
               :repos_url=>"https://api.github.com/users/MackHalliday/repos",
               :events_url=>"https://api.github.com/users/MackHalliday/events{/privacy}",
               :received_events_url=>"https://api.github.com/users/MackHalliday/received_events",
               :type=>"User",
               :site_admin=>false}
    end
  it "has attributes" do
    expect(FollowedAccount.new(@hash).class).to be(FollowedAccount)
    account = FollowedAccount.new(@hash)
    expect(account).to be_a(FollowedAccount)
    expect(account.name).to eq("MackHalliday")
    expect(account.url).to eq("https://github.com/MackHalliday")
    expect(account.uid).to eq(16658577)
  end
end
