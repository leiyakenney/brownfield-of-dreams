# frozen_string_literal: true

class EmailActivatorMailer < ApplicationMailer
  def notify(user)
    @user = user
    mail(to: @user.email, subject: 'Brownfield Activation Email')
  end
end
