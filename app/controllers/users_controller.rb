# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @current_user = current_user
    @bookmarks = @current_user.videos.ordered_grouped_videos

    if @current_user.github_token?
      render locals: {
        repos: RepoFacade.new.create_repos(@current_user),
        followers: FollowersFacade.new.create_followers(@current_user),
        followed_accounts: FollowedAccountsFacade.new.create_followed_accounts(@current_user)
      }
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      EmailActivatorMailer.notify(user).deliver
      redirect_to dashboard_path
      flash[:success] = "Logged in as #{user.first_name} #{user.last_name}"
      flash[:notice] = 'This account has not yet been activated. Please check your email.'
    else
      flash[:error] = user.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    user = User.find(params[:id])
    user.update_attribute(:active, true)
    user.save
    flash[:success] = 'Your account has been activated!'
    redirect_to '/dashboard'
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end
