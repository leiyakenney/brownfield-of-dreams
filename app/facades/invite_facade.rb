# frozen_string_literal: true

class InviteFacade
  def create_invite(github_handle, current_user)
    GithubSearchResults.new(current_user).email(github_handle)
  end
end
