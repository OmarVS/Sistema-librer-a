class ShoppingCartsController < ApplicationController
	def show
	end

	def destroy
    @shoppingcart.destroy
    respond_to do |format|
      format.html { redirect_to shoppingcarts_url, notice: 'shoppingcart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
