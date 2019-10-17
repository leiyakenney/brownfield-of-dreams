# frozen_string_literal: true

require 'rails_helper'

describe Follower, type: :model do
  before(:each) do
    @hash = { login: 'wolfeJob',
              id: 33_855_435,
              node_id: 'MDQ6VXNlcjMzODU1NDM1',
              avatar_url: 'https://avatars3.githubusercontent.com/u/33855435?v=4',
              gravatar_id: '',
              url: 'https://api.github.com/users/wolfeJob',
              html_url: 'https://github.com/wolfeJob',
              followers_url: 'https://api.github.com/users/wolfeJob/followers',
              following_url: 'https://api.github.com/users/wolfeJob/following{/other_user}',
              gists_url: 'https://api.github.com/users/wolfeJob/gists{/gist_id}',
              starred_url: 'https://api.github.com/users/wolfeJob/starred{/owner}{/repo}',
              subscriptions_url: 'https://api.github.com/users/wolfeJob/subscriptions',
              organizations_url: 'https://api.github.com/users/wolfeJob/orgs',
              repos_url: 'https://api.github.com/users/wolfeJob/repos',
              events_url: 'https://api.github.com/users/wolfeJob/events{/privacy}',
              received_events_url: 'https://api.github.com/users/wolfeJob/received_events',
              type: 'User',
              site_admin: false }
  end
  it 'has attributes' do
    expect(Follower.new(@hash).class).to be(Follower)
    account = Follower.new(@hash)
    expect(account).to be_a(Follower)
    expect(account.name).to eq('wolfeJob')
    expect(account.url).to eq('https://github.com/wolfeJob')
    expect(account.uid).to eq(33_855_435)
  end
end
