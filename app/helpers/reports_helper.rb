module ReportsHelper
  def calc_purchases(barcode,year,month)
    @purchases = Purchase.where('extract(year from created_at) = ? and extract(month from created_at) = ?',year,month)
    sum = 0
    @purchases.each do |p|
      if p.product_barcode == barcode
        sum += p.amount*p.price
      end
    end
    sum
  end

  def amount_purchases(barcode,year,month)
    @purchases = Purchase.where('extract(year from created_at) = ? and extract(month from created_at) = ?',year,month)
    @purchases = @purchases.where(product_barcode: barcode).sum(:amount)
    @purchases
  end

  def calc_sales(barcode,year,month)
    @sales = Sale.where('extract(year from created_at) = ? and extract(month from created_at) = ?',year,month)
    sum = 0
    @sales.each do |p|
      if p.product_barcode == barcode
        sum += p.amount*p.price
      end
    end
    sum
  end

  def amount_sales(barcode,year,month)
    @sales = Sale.where('extract(year from created_at) = ? and extract(month from created_at) = ?',year,month)
    @sales = @sales.where(product_barcode: barcode).sum(:amount)
    @sales
  end

  def calc_earnings(barcode,year,month)
    sum = calc_sales(barcode,year,month) - calc_purchases(barcode,year,month)
    sum
  end

end
