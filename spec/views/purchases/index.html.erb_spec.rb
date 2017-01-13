require 'rails_helper'

RSpec.describe "purchases/index", type: :view do
  before(:each) do
    assign(:purchases, [
      Purchase.create!(
        :product_barcode => 2,
        :provider_rut => 3,
        :amount => 4,
        :price => 5
      ),
      Purchase.create!(
        :product_barcode => 2,
        :provider_rut => 3,
        :amount => 4,
        :price => 5
      )
    ])
  end

  it "renders a list of purchases" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
