class CreateEmployeeSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :employee_surveys do |t|
      t.belongs_to :employee, index: true 
      t.belongs_to :survey, index: true 
      t.timestamps
    end
  end
end
