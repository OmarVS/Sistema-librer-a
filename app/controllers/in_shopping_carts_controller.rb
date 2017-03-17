class InShoppingCartsController < ApplicationController
	before_filter :signed_in
	def create
		if in_stock?
			in_shopping_cart = InShoppingCart.new(product_barcode: params[:product_barcode], shopping_cart: @shopping_cart)

			if in_shopping_cart.save
				redirect_to carrito_path, notice: "Guardamos el producto en tu carrito"
			else
				redirect_to carrito_path(barcode: params[:product_barcode]), notice: "No pudimos guardar en el carrito"
			end
		else
			redirect_to carrito_path(barcode: params[:product_barcode]), notice: "No tenemos stock disponible"
		end
	end

	def destroy
		@in_shopping_cart = InShoppingCart.find(params[:id])

		@in_shopping_cart.destroy

		redirect_to carrito_path
	end
	private
		def in_stock?
			@product = Product.find_by_barcode(params[:product_barcode])
				if @product.nil?
					@product = Book.find_by_barcode(params[:product_barcode])
				end
			true if @product.stock > 0
		end

end
