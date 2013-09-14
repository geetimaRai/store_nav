class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :department_id
      t.string :name
      t.integer :isle
      t.integer :quantity

      t.timestamps
    end
  end
end
