class UsersController < ApplicationController
  def home
  end

  def create
    @u = User.new(new_user)
    if @u.save
      session[:user_id] = @u.id
      redirect_to "/auctions"
    else
      flash[:errors] = @u.errors.full_messages
      redirect_to :back
    end
  end

  def new
  end

  def edit
    @user = User.find(session[:user_id])
    if @user.address_id
      @address = Address.find(@user.address_id)
    end
  end

  def update
  end

  def destroy
  end
  private
    def new_user
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
