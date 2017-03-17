class InShoppingCartsController < ApplicationController
	before_filter :signed_in
	def create
		if in_stock?
			in_shopping_cart = InShoppingCart.new(product_id: params[:product_id], shopping_cart: @shopping_cart)

			if in_shopping_cart.save
				redirect_to carrito_path, notice: "Guardamos el producto en tu carrito"
			else
				redirect_to products_path(id: params[:product_id]), notice: "No pudimos guardar en el carrito"
			end
		else
			redirect_to products_path(id: params[:product_id]), notice: "No tenemos stock disponible"
		end
	end

	def destroy
		@in_shopping_cart = InShoppingCart.find(params[:id])

		@in_shopping_cart.destroy

		redirect_to carrito_path
	end
	private
		def in_stock?
			@product = Product.find(params[:product_id])
			true if @product.stock > 0 
		end

end
