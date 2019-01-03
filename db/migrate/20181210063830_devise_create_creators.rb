# frozen_string_literal: true

class DeviseCreateCreators < ActiveRecord::Migration[5.2]
  def change
    create_table :creators, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      ## Database authenticatable
      t.string :email, :unique => false
      t.string :name,               null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.string  :shop_name
      t.integer :shop_status_id
      t.integer :send_date_id
      t.integer :address_lines_id
      t.text  :image
      t.boolean :delete_flag, default: false, null: false
      t.string  :telephone
      t.text  :description
      t.timestamps null: false
    end

    add_index :creators, :name,                unique: true
    add_index :creators, :reset_password_token, unique: true
    # add_index :creators, :confirmation_token,   unique: true
    # add_index :creators, :unlock_token,         unique: true
  end
end
