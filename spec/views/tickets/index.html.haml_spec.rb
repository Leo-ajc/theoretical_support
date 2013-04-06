require 'spec_helper'

describe "tickets/index" do
  before(:each) do
    assign(:tickets, [
      stub_model(Ticket,
        :body => "",
        :department_id => "",
        :user_id => "",
        :client_id => "Client"
      ),
      stub_model(Ticket,
        :body => "",
        :department_id => "",
        :user_id => "",
        :client_id => "Client"
      )
    ])
  end

  it "renders a list of tickets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Client".to_s, :count => 2
  end
end
