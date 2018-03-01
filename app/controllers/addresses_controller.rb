class AddressesController < ApplicationController
  def create
    @user = User.find(session[:user_id])
    @address = Address.new(update_address)
    User.update(@user.id, address: @address)
    if @address.save
      redirect_to edit_user_path(params[:id])
    else
      flash[:errors] = @address.errors.full_messages 
      redirect_to edit_user_path(params[:id])
    end
  end

  def update
    @user = User.find(session[:user_id])
    @address = Address.find(@user.address_id)
      if @address.update(update_address)
        redirect_to edit_user_path(params[:id])
      else
        flash[:errors] = @address.errors.full_messages   
        redirect_to edit_user_path(params[:id])        
      end
  end
  private
    def update_address
      params.require(:address).permit(:street, :city, :state, :zip_code)
    end
end
