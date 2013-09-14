class CreateDepartmentsStores < ActiveRecord::Migration
  def change
    create_table :departments_stores do |t|
      t.integer :department_id
      t.integer :store_id

      t.timestamps
    end
  end
end
