# frozen_string_literal: true

require 'rails_helper'

describe Repo, type: :model do
  before(:each) do
    @hash = { id: 206_138_164,
              node_id: 'MDEwOlJlcG9zaXRvcnkyMDYxMzgxNjQ=',
              name: 'monster_shop_1906',
              full_name: 'alect47/monster_shop_1906',
              private: false,
              owner: { login: 'alect47',
                       id: 23_268_508,
                       node_id: 'MDQ6VXNlcjIzMjY4NTA4',
                       avatar_url: 'https://avatars2.githubusercontent.com/u/23268508?v=4',
                       gravatar_id: '',
                       url: 'https://api.github.com/users/alect47',
                       html_url: 'https://github.com/alect47',
                       followers_url: 'https://api.github.com/users/alect47/followers',
                       following_url: 'https://api.github.com/users/alect47/following{/other_user}',
                       gists_url: 'https://api.github.com/users/alect47/gists{/gist_id}',
                       starred_url: 'https://api.github.com/users/alect47/starred{/owner}{/repo}',
                       subscriptions_url: 'https://api.github.com/users/alect47/subscriptions',
                       organizations_url: 'https://api.github.com/users/alect47/orgs',
                       repos_url: 'https://api.github.com/users/alect47/repos',
                       events_url: 'https://api.github.com/users/alect47/events{/privacy}',
                       received_events_url: 'https://api.github.com/users/alect47/received_events',
                       type: 'User',
                       site_admin: false },
              html_url: 'https://github.com/alect47/monster_shop_1906' }
  end
  it 'has attributes' do
    expect(Repo.new(@hash).class).to be(Repo)
    account = Repo.new(@hash)
    expect(account).to be_a(Repo)
    expect(account.name).to eq('monster_shop_1906')
    expect(account.url).to eq('https://github.com/alect47/monster_shop_1906')
  end
end
