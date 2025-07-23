require 'rails_helper'

RSpec.describe "sms_messages/new", type: :view do
  before(:each) do
    assign(:sms_message, SmsMessage.new(
      phone_number: "MyString",
      message: "MyText"
    ))
  end

  it "renders new sms_message form" do
    render

    assert_select "form[action=?][method=?]", sms_messages_path, "post" do

      assert_select "input[name=?]", "sms_message[phone_number]"

      assert_select "textarea[name=?]", "sms_message[message]"
    end
  end
end
