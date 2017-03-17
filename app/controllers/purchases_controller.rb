class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all
    if params[:date].present?
      if params[:mes].present? && params[:mes]=='yes'
        @purchases = Purchase.where('extract(month from created_at) = ? AND extract(year from created_at) = ?', params[:date]['month'], params[:date]['year'])
      else
        @purchases = Purchase.where('extract(year from created_at) = ?',params[:date]['year'])
      end
    end
    if params[:rut].present?
      @purchases = Purchase.where('provider_rut = ?',params[:rut])
    end
    if params[:barcode].present?
      @purchases = Purchase.where('product_barcode = ?',params[:barcode])
    end
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
  end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
    if params[:product_barcode].present?
      @purchase.product_barcode = params[:product_barcode]
    end
    product_purchase = @purchase.product_purchases.build
  end

  # GET /purchases/1/edit
  def edit
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @purchase = Purchase.new(purchase_params)
    if params[:product_barcode].present?
      @purchase.product_barcode = params[:product_barcode]
    end
    respond_to do |format|
      if @purchase.save
        for product_purchase in @purchase.product_purchases
          product = producto(product_purchase.product_barcode)
          product.stock = product.stock + product_purchase.amount
          product.save
        end
        format.html { redirect_to purchase_path(@purchase), notice: 'Compra registrada con éxito.' }
        format.json { render :show, status: :created, location: @purchase }
      else
        format.html { render :new }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchases/1
  # PATCH/PUT /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: 'Compra actualizada con éxito.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    for product_purchase in @purchase.product_purchases
      product = producto(product_purchase.product_barcode)
      product.stock = product.stock - product_purchase.amount
      product.save
    end
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Compra eliminada con éxito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit(:provider_rut, :created_at, product_purchases_attributes: [:product_barcode, :amount, :price, :_destroy])
    end
end
