module ApplicationHelper
  def moneda(number)
    number_to_currency(number, :unit => "$ ", :separator => ",", :delimiter => ".", :precision => 0)
  end

  def numero(number)
    number_with_delimiter(number, :separator => ",", :delimiter => ".")
  end

  def producto(barcode)
    producto = Product.find_by_barcode(barcode)
    if producto.nil?
      producto = Book.find_by_barcode(barcode)
    end
    producto
  end

  def permitido?
    if signed_in?
      true if current_user.kind == 'Admin'
    else
      false
    end
  end

  def Admin
    unless permitido?
      store_location
      redirect_to signin_path, notice: "Sólo permitido a usuarios con autorización"
    end
  end

end
