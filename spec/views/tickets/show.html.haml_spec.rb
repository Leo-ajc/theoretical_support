require 'spec_helper'

describe "tickets/show" do
  before(:each) do
    @ticket = assign(:ticket, stub_model(Ticket,
      :body => "",
      :department_id => "",
      :user_id => "",
      :client_id => "Client"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Client/)
  end
end
