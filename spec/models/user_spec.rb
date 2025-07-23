require 'rails_helper'

RSpec.describe User, type: :model do
  describe "assoications" do
    it { should have_many(:sms_messages).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end
end
