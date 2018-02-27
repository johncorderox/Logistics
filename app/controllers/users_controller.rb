class UsersController < ApplicationController
  def home
  end

  def create
    @u = User.new(new_user)
    if @u.save
      session[:user_id] = @u.id
      redirect_to "/dashboard"
    else
      flash[:errors] = @u.errors.full_messages
      redirect_to :back
    end
  end

  def new
  end

  def edit
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
