require 'spec_helper'

describe "refunds/edit.html.erb" do
  before(:each) do
    @refund = assign(:refund, stub_model(Refund,
      :name => "MyString",
      :value => 1.5,
      :min_base_value => 1.5,
      :max_base_value => 1.5
    ))
  end

  it "renders the edit refund form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => refunds_path(@refund), :method => "post" do
      assert_select "input#refund_name", :name => "refund[name]"
      assert_select "input#refund_value", :name => "refund[value]"
      assert_select "input#refund_min_base_value", :name => "refund[min_base_value]"
      assert_select "input#refund_max_base_value", :name => "refund[max_base_value]"
    end
  end
end
