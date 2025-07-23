require 'rails_helper'

RSpec.describe "sms_messages/edit", type: :view do
  let(:sms_message) {
    SmsMessage.create!(
      phone_number: "MyString",
      message: "MyText"
    )
  }

  before(:each) do
    assign(:sms_message, sms_message)
  end

  it "renders the edit sms_message form" do
    render

    assert_select "form[action=?][method=?]", sms_message_path(sms_message), "post" do

      assert_select "input[name=?]", "sms_message[phone_number]"

      assert_select "textarea[name=?]", "sms_message[message]"
    end
  end
end
