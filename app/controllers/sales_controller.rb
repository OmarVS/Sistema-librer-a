class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all.includes(:user)
    if params[:user_id].present?
      @sales = @sales.where(user_id: params[:user_id])
    end
    if params[:product_barcode].present?
      @sales = @sales.where(product_barcode: params[:product_barcode])
    end
    if params[:date].present?
      if params[:mes].present? && params[:mes]=='yes'
        @sales = @sales.where('extract(month from created_at) = ? AND extract(year from created_at) = ?', params[:date]['month'], params[:date]['year'])
      else
        @sales = @sales.where('extract(year from created_at) = ?',params[:date]['year'])
      end
    end
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    product_sale = @sale.product_sales.build
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)
    respond_to do |format|
      if @sale.save
        for product_sale in @sale.product_sales
          product = producto(product_sale.product_barcode)
          product.stock = product.stock - product_sale.amount
          product.save
        end
        format.html { redirect_to @sale, notice: 'Venta registrada con éxito.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Venta actualizada con éxito.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    for product_sale in @sale.product_sales
      product = producto(product_sale.product_barcode)
      product.stock = product.stock + product_sale.amount
      product.save
    end
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Venta anulada con éxito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:user_id, :created_at, product_sales_attributes: [:product_barcode, :amount, :_destroy])
    end

    def producto(barcode)
      product = Product.find_by_barcode(barcode)
      if product.nil?
        product = Book.find_by_barcode(barcode)
      end
      product
    end
end
