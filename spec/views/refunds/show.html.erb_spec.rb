require 'spec_helper'

describe "refunds/show.html.erb" do
  before(:each) do
    @refund = assign(:refund, stub_model(Refund,
      :name => "Name",
      :value => 1.5,
      :min_base_value => 1.5,
      :max_base_value => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
  end
end
