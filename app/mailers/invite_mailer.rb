# frozen_string_literal: true

class InviteMailer < ApplicationMailer
  def invite(user_id, friend_email, friend_name)
    @user = User.find(user_id)
    @friend_email = friend_email
    @friend_name = friend_name
    # binding.pry
    mail(to: @friend_email, subject: 'Your friend has invited you to join Brownfield of Dreams!')
  end
end
