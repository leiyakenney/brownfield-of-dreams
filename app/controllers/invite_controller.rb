class InviteController < ApplicationController

  def new
    user_info_hash = InviteFacade.new.create_invite(params[:github_handle], current_user)
    # binding.pry
    InviteMailer.invite(current_user.id, user_info_hash[:bio], user_info_hash[:name]).deliver
    redirect_to dashboard_path
    flash[:notice] = "Successfully sent invite!"
  end

  def show
  end

end
