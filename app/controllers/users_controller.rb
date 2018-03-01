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

  def subscribe
    @subscribe = Subscribe.new(:email => params[:email] )
    if @subscribe.save
      UserMailer.signup_confirmation(@subscribe).deliver_now
      redirect_to "/"
    else 
      redirect_to :back
    end
  end

  def new
  end

  def edit
    @user = User.find(session[:user_id])
    if @user.address_id != nil
      @address = Address.find(@user.address_id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.address_id == nil
      @address = Address.new(update_address)
      User.update(@user.id, address: @address)
        if @address.save && User.update(params[:id], update_user)
          redirect_to edit_user_path(params[:id])
        else
          flash[:errors] = @user.errors.full_messages && @address.errors.full_messages
          redirect_to edit_user_path(params[:id])
        end
    else 
      if User.update(params[:id], update_user) && Address.update(@user.address_id, update_address)
        redirect_to edit_user_path(params[:id])
      else
        flash[:errors] = @user.errors.full_messages && @address.errors.full_messages
        redirect_to edit_user_path(params[:id])        
      end
    end
  end

  def destroy
  end
  private
    def new_user
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

    def update_user
      params.require(:user).permit(:first_name, :last_name, :email, :company, :phone_number)
    end
end
