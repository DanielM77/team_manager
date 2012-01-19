require 'spec_helper'

describe "refunds/index.html.erb" do
  before(:each) do
    assign(:refunds, [
      stub_model(Refund,
        :name => "Name",
        :value => 1.5,
        :min_base_value => 1.5,
        :max_base_value => 1.5
      ),
      stub_model(Refund,
        :name => "Name",
        :value => 1.5,
        :min_base_value => 1.5,
        :max_base_value => 1.5
      )
    ])
  end

  it "renders a list of refunds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
