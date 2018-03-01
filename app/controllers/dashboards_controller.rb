class DashboardsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @bids = Bid.where(user: @user)
  end
end
