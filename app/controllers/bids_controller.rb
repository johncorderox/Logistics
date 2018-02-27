class BidsController < ApplicationController
  def create
    @new_bid = Bid.new(price: params[:price], user: User.find(session[:user_id]), auction: Auction.find(params[:auction_id]))
    if @new_bid.save
    else
      flash[:errors] = @new_bid.errors.full_messages
    end
      redirect_to :back
  end

  def destroy
  end
end
