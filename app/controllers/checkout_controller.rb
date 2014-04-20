class CheckoutController < ApplicationController
	before_action :authenticate_user!

	def checkout
    @user = User.find(current_user.id)
    check_address_status
	end

  def check_address_status
    @user = User.find(current_user.id)
    if @user.default_bill.nil? || @user.default_ship.nil?
      flash[:notice] = 'You must add an address before you can continue with checkout!'
      redirect_to addresses_path
    end
  end
end
