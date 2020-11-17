class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.uuid :employee_id
      t.string :name
      t.string :email
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
