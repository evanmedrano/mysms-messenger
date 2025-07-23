require 'rails_helper'

RSpec.describe "sms_messages/show", type: :view do
  before(:each) do
    assign(:sms_message, SmsMessage.create!(
      phone_number: "Phone Number",
      message: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/MyText/)
  end
end
