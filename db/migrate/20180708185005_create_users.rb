class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :address
      t.string :provider
      t.string :uid
      t.string :oauth_token
      t.datetime :oauth_expiration
      t.string :verfication_code
      t.string :phone

      t.timestamps
    end
  end
end
