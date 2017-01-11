require 'rails_helper'

RSpec.describe "purchases/edit", type: :view do
  before(:each) do
    @purchase = assign(:purchase, Purchase.create!(
      :product => nil,
      :provider => nil,
      :amount => 1,
      :price => 1
    ))
  end

  it "renders the edit purchase form" do
    render

    assert_select "form[action=?][method=?]", purchase_path(@purchase), "post" do

      assert_select "input#purchase_product_id[name=?]", "purchase[product_id]"

      assert_select "input#purchase_provider_id[name=?]", "purchase[provider_id]"

      assert_select "input#purchase_amount[name=?]", "purchase[amount]"

      assert_select "input#purchase_price[name=?]", "purchase[price]"
    end
  end
end
