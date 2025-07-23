class SmsMessage < ApplicationRecord
  belongs_to :user

  # TODO: add validation for valid phone number

  validates :message, presence: true, length: { maximum: 250 }
  validates :phone_number, presence: true
end
