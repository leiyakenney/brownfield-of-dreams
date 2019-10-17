class GithubFacade
  attr_reader :current_user

  def initialize(current_user)
    @current_user = current_user
  end

  def repos
    RepoFacade.new.create_repos(@current_user)
  end

  def followers
    FollowersFacade.new.create_followers(@current_user)
  end

  def followed_accounts
    FollowedAccountsFacade.new.create_followed_accounts(@current_user)
  end
end
