class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, force: true do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.text :password_digest

      t.timestamps
    end
   add_index :email, unique: true
  end
end
