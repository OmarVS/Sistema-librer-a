module ReportsHelper
  def calc_purchases(barcode,year,month)
    @purchases = Purchase.where('extract(year from created_at) = ? and extract(month from created_at) = ?',year,month)
    sum = 0
    @purchases.each do |purchase|
      for p in purchase.product_purchases do
        if p.product_barcode == barcode
          sum += p.amount*p.price
        end
      end
    end
    sum
  end

  def amount_purchases(barcode,year,month)
    @purchases = Purchase.where('extract(year from created_at) = ? and extract(month from created_at) = ?',year,month)
    suma=0
    @purchases.each do |purchase|
      suma += purchase.product_purchases.where(product_barcode: barcode).sum(:amount)
    end
    suma
  end

  def calc_sales(barcode,year,month)
    @sales = Sale.where('extract(year from created_at) = ? and extract(month from created_at) = ?',year,month)
    sum = 0
    @sales.each do |sale|
      for p in sale.product_sales do
        if p.product_barcode == barcode
          sum += p.amount*p.price
        end
      end
    end
    sum
  end

  def amount_sales(barcode,year,month)
    @sales = Sale.where('extract(year from created_at) = ? and extract(month from created_at) = ?',year,month)
    suma=0
    @sales.each do |sale|
      suma += sale.product_sales.where(product_barcode: barcode).sum(:amount)
    end
    suma
  end

  def calc_earnings(barcode,year,month)
    sum = calc_sales(barcode,year,month) - calc_purchases(barcode,year,month)
    sum
  end

end
