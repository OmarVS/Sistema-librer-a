module SalesHelper
  def subtotal_venta(product_sale)
    suma=product_sale.amount*product_sale.price
    suma
  end

  def total_venta(sale)
    suma=0
    for product_sale in sale.product_sales
      suma+=subtotal_venta(product_sale)
    end
    suma
  end

  def cant_vendida(sale)
    suma=0
    for product_sale in sale.product_sales
      suma+=product_sale.amount
    end
    suma
  end
end
