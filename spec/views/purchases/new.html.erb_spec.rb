require 'rails_helper'

RSpec.describe "purchases/new", type: :view do
  before(:each) do
    assign(:purchase, Purchase.new(
      :product_barcode => 1,
      :provider_rut => 1,
      :amount => 1,
      :price => 1
    ))
  end

  it "renders new purchase form" do
    render

    assert_select "form[action=?][method=?]", purchases_path, "post" do

      assert_select "input#purchase_product_barcode[name=?]", "purchase[product_barcode]"

      assert_select "input#purchase_provider_rut[name=?]", "purchase[provider_rut]"

      assert_select "input#purchase_amount[name=?]", "purchase[amount]"

      assert_select "input#purchase_price[name=?]", "purchase[price]"
    end
  end
end
