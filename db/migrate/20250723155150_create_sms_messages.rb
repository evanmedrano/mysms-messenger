class CreateSmsMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :sms_messages do |t|
      t.string :phone_number, null: false
      t.text :message, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
