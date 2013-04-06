require 'spec_helper'

describe "clients/edit" do
  before(:each) do
    @client = assign(:client, stub_model(Client,
      :email => "MyString"
    ))
  end

  it "renders the edit client form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", client_path(@client), "post" do
      assert_select "input#client_email[name=?]", "client[email]"
    end
  end
end
