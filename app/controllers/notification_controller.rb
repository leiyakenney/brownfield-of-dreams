class NotificationController < ApplicationController
  def create
    EmailActivatorMailer.inform(current_user, params[:email]).deliver_now
    flash[:notice] = "Activation email sent."
    redirect_to root_path
  end
end
