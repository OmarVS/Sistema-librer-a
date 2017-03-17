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

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to(name, nil, onclick: "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to(name, nil, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end
end
