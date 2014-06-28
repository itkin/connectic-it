class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :sender_name
      t.string :sender_email
      t.text :message

      t.timestamps
    end
  end
end
