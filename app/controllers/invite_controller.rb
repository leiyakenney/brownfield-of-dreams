# frozen_string_literal: true

class InviteController < ApplicationController
  def new
    user_info_hash = InviteFacade.new.create_invite(params[:github_handle], current_user)
    email = user_info_hash[:bio]
    if !email.nil?
      InviteMailer.invite(current_user.id, user_info_hash[:bio], user_info_hash[:name]).deliver
      redirect_to dashboard_path
      flash[:notice] = 'Successfully sent invite!'
    else email.nil?
         redirect_to dashboard_path
         flash[:notice] = "The Github user you selected doesn't have an email address associated with their account."
    end
  end

  def show; end
end
