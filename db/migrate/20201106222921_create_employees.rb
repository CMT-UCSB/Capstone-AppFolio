class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees, id: :uuid do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.references :manager
      t.timestamps
    end
  end
end
