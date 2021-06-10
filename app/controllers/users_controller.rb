class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
 @created_events = @user.created_events
  end
end
