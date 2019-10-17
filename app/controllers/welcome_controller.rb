# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    if params[:tag] && current_user
      @tutorials = Tutorial.tag_paginate(params[:tag], params[:page])
    elsif params[:tag] && !current_user
      @tutorials = Tutorial.no_class.tag_paginate(params[:tag], params[:page])
    elsif current_user
      @tutorials = Tutorial.all.paginate(page: params[:page], per_page: 5)
    else
      @tutorials = Tutorial.all.no_class
                           .paginate(page: params[:page], per_page: 5)
    end
  end
end
