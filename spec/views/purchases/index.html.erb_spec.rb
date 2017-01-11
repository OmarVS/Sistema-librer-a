require 'rails_helper'

RSpec.describe "purchases/index", type: :view do
  before(:each) do
    assign(:purchases, [
      Purchase.create!(
        :product => nil,
        :provider => nil,
        :amount => 2,
        :price => 3
      ),
      Purchase.create!(
        :product => nil,
        :provider => nil,
        :amount => 2,
        :price => 3
      )
    ])
  end

  it "renders a list of purchases" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
