module ApplicationHelper
  def moneda(number)
    number_to_currency(number, :unit => "$ ", :separator => ",", :delimiter => ".", :precision => 0)
  end

  def numero(number)
    number_with_delimiter(number, :separator => ",", :delimiter => ".")
  end
end
