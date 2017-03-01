module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}
  end

  def moneda(number)
    number_to_currency(number, :unit => "$ ", :separator => ",", :delimiter => ".", :precision => 0)
  end
end
