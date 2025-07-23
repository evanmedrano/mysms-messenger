require 'rails_helper'

RSpec.describe SmsMessage, type: :model do
  describe "assoications" do
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_length_of(:message).is_at_most(250) }

    it { should validate_presence_of(:message) }
    it { should validate_presence_of(:phone_number) }
  end
end
