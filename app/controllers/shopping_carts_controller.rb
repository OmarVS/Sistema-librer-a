class ShoppingCartsController < ApplicationController
	def show
		if @shopping_cart.payed?
			render "shopping_carts/complete"
			return
		end
	end

	def destroy
    @shopping_cart.destroy
    respond_to do |format|
      format.html { redirect_to shoppingcarts_url, notice: 'shoppingcart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
