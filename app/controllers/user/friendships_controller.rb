# frozen_string_literal: true

class User::FriendshipsController < ApplicationController
  def create
    if (current_user.friendships != []) && (current_user.friendships
       .any? { |friendship| friendship.friend.id.to_s == params['friend_id'] })
      flash[:error] = 'You are already friends with this person'
    else
      current_user.friendships.create!(user_id: params['id'],
                                       friend_id: params['friend_id'])
      User.find(params['friend_id']).friendships
          .create!(user_id: params['friend_id'], friend_id: params['id'])
    end
    redirect_to '/dashboard'
  end
end
