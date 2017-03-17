module PurchasesHelper
  def subtotal_compra(product_purchase)
    suma=product_purchase.amount*product_purchase.price
    suma
  end

  def total_compra(purchase)
    suma=0
    for product_purchase in purchase.product_purchases
      suma+=subtotal_compra(product_purchase)
    end
    suma
  end

  def cant_comprada(purchase)
    suma=0
    for product_purchase in purchase.product_purchases
      suma+=product_purchase.amount
    end
    suma
  end
end
